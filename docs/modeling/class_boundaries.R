library(tidymodels)
library(kernlab)
library(patchwork)
tidymodels_prefer()

# ------------------------------------------------------------------------------

data(parabolic)

set.seed(91)
split <- initial_split(parabolic, strata = "class", prop = 1/2)

training_set <- training(split)
testing_set  <-  testing(split)

data_grid <-
  crossing(X1 = seq(-6, 5, length = 200),
           X2 = seq(-6, 5, length = 200))


two_class_rec <-
  recipe(class ~ ., data = parabolic) %>%
  step_normalize(all_numeric_predictors())

svm_mod <-
  svm_rbf(cost = tune(), rbf_sigma = 1) %>%
  set_engine("kernlab") %>%
  set_mode("classification")

svm_wflow <-
  workflow() %>%
  add_recipe(two_class_rec) %>%
  add_model(svm_mod)

vals <- c("underfit", "about right", "overfit")
svm_res <-
  tibble(
    cost = c(0.005, 0.5, 1000),
    label = factor(vals, levels = vals),
    train = NA_real_,
    test = NA_real_,
    model = vector(mode = "list", length = 3)
  )

for (i in 1:nrow(svm_res)) {
  set.seed(27)
  tmp_mod <-
    svm_wflow %>% 
    finalize_workflow(svm_res %>% slice(i) %>% select(cost)) %>%
    fit(training_set)
  svm_res$train[i] <-
    roc_auc_vec(training_set$class,
                predict(tmp_mod, training_set, type = "prob")$.pred_Class1)
  svm_res$test[i]  <-
    roc_auc_vec(testing_set$class,
                predict(tmp_mod, testing_set, type = "prob")$.pred_Class1)
  svm_res$model[[i]] <- tmp_mod
}


te_plot <-
  svm_res %>%
  mutate(probs = map(model, ~ bind_cols(
    data_grid, predict(.x, data_grid, type = "prob")
  ))) %>%
  dplyr::select(label, probs) %>%
  unnest(cols = c(probs)) %>%
  ggplot(aes(x = X1, y = X2)) +
  geom_point(
    data = testing_set,
    aes(col = class),
    alpha = .75,
    cex = 3/4,
    show.legend = FALSE
  ) +
  geom_contour(aes(z = .pred_Class1), breaks = 0.5, col = "black") +
  facet_wrap( ~ label, nrow = 1) +
  ggtitle("Test Set") +
  labs(x = "Predictor A", y = "Predictor B") +
  theme_bw()

tr_plot <-
  svm_res %>%
  mutate(probs = map(model, ~ bind_cols(
    data_grid, predict(.x, data_grid, type = "prob")
  ))) %>%
  dplyr::select(label, probs) %>%
  unnest(cols = c(probs)) %>%
  ggplot(aes(x = X1, y = X2)) +
  geom_point(
    data = training_set,
    aes(col = class),
    alpha = .75,
    cex = 3/4,
    show.legend = FALSE
  ) +
  geom_contour(aes(z = .pred_Class1), breaks = 0.5, col = "black") +
  facet_wrap( ~ label, nrow = 1) +
  ggtitle("Training Set") +
  labs(x = "Predictor A", y = "Predictor B") +
  theme_bw()
tr_plot / te_plot