
library(markdown)
library(knitr)
library(rmarkdown)
library(revealjs)

rmarkdown::render("rr_lab.Rmd")
rmarkdown::render("rr_challenge_report.Rmd")
rmarkdown::render("rr_challenge_ioslides.Rmd")
rmarkdown::render("rr_challenge_revealjs.Rmd")
rmarkdown::render("rr_challenge_xaringan.Rmd")
