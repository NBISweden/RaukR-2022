# ------------------------------------------------------------------------------
# Discussion of shuffling after slide 66

predict(cell_fit, cell_test) %>% 
  bind_cols(cell_test) %>% 
  accuracy(class, .pred_class)

# ------------------------------------------------------------------------------

pls_rec_shuff <- 
  recipe(class ~ ., data = cell_train) %>% 
  step_YeoJohnson(all_numeric_predictors()) %>% 
  step_normalize(all_numeric_predictors()) %>% 
  step_shuffle(class, skip = TRUE) %>% # <- only applied to training set
  step_pls(all_numeric_predictors(), outcome = "class", num_comp = 20) 

cell_wflow_shuff <- 
  cell_wflow %>% 
  update_recipe(pls_rec_shuff)  

cell_wflow_shuff_fit <- 
  cell_wflow_shuff %>% 
  fit(cell_train)

predict(cell_wflow_shuff_fit, cell_test) %>% 
  bind_cols(cell_test) %>% 
  accuracy(class, .pred_class)

mean(cell_train$class == "PS")
