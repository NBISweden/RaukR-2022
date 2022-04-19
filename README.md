# RaukR 2022 • Teaching Materials

Welcome to the RaukR 2022 Teaching Materials GitHub repository.

## 1. How to add my own materials?

### 1.1 Start here

* **Fork** this repository (**NBISweden/RaukR-XXXX**) to your GitHub (**user/RaukR-XXXX**).
* **Clone** your **fork** to your local computer.

### 1.2.1 If you are reusing content from last year

* You can simply delete the `assets` directory and replace it with the new `assets` directory for [presentation](https://github.com/NBISweden/raukrtemplate/tree/master/inst/rmarkdown/templates/presentation/skeleton) or [lab](https://github.com/NBISweden/raukrtemplate/tree/master/inst/rmarkdown/templates/lab/skeleton).
* Render your .Rmd again and verify changes

### 1.2.2 If you are creating new content

* Install the R package [raukrtemplate](https://github.com/NBISweden/raukrtemplate) and follow instructions there to create a template on your system. Label it **topic_presentation.Rmd** or **topic_lab.Rmd**.

### 1.3 When content is ready

* When done, copy source materials (.Rmd), rendered files (.html) and all supporting files and folders to `/topic/presentation/` or `/topic/lab/`.
* Add links to your rendered html files in `index.md`.
* Push the updated changes to from your **local clone** to **your fork (user/RaukR-XXXX)**.

**TIP:** You can preview the render version of the pages on your fork (**user/RaukR-XXXX**). Go to **user/RaukR-XXXX**, Settings > Pages. Then enable GitHub pages to be hosted from the `main` branch and `root` directory and click **Save**. The rendered pages should be visible at **user.github.io/RaukR-XXXX**. This can anywhere from a few minutes to 10 mins. Remember to hard refresh (Shift) your browser.

* Then send a pull request (online) from **your fork (user/RaukR-XXXX)** to (**NBISweden/RaukR-XXXX**) and assign one of your colleagues as a reviewer.
* When you get back your reviewer's comments, address them and push changes from your **local clone** to **your fork (user/RaukR-XXXX)**.
* The new updates are automatically added to your previous pull request.
* The reviewer accepts and merges the pull request (online). You can also merge it yourself for subsequent pull requests.
* Continue making your materials even better. Create a new pull request when you achieve next milestone.

## 2. As a reviewer.

* Check for typos, readability, rendering issues. Also look if something is missing in the content or give suggestions on how to improve it.
* If possible, try to run the code to check that it is reproducible.
* You can work in two ways:
    + clone your colleagues fork, work on her/his presentation slides/lab and pull request the changes that she/he will merge OR
    + just leave the comments in the pull request and let the author know.

## 3. Seeing the content.

If you add to links to your rendered html files to `index.md`, the content can be seen at: https://nbisweden.github.io/RaukR-2022/

## 4. Large files (datasets)

If you have files larger than 100Mb in your materials, e.g. a dataset:

**before** you issue `git add yourlargefile` follow instructions here: https://git-lfs.github.com
