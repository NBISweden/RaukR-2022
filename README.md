# RaukR 2022 • Teaching Materials

Welcome to the RaukR 2022 Teaching Materials GitHub repository.

## How to add my own materials?

* **Fork** this repository (**NBISweden/RaukR-XXXX**) to your GitHub (**user/RaukR-XXXX**).
* **Clone** your **fork** to your local computer.
* If you already have started preparing materials, copy the folders to `/docs/topic/presentation` and `/docs/topic/lab`.
* In the `/docs/topic/presentation` folder add all files needed to render the presentation and its rendered version in html. Just copy contents of the folder you have rendered in R-studio.
* In the `/docs/topic/lab` add all files needed to render the lab and its rendered version in html. Just copy contents of the folder you have rendered in R-studio.
* Add links to your rendered html files to `docs/index.md`.
* Push the updated changes to from your **local clone** to **your fork (user/RaukR-XXXX)**.
* **TIP:** You can preview the render version of the pages on your fork (**user/RaukR-XXXX**). Go to **user/RaukR-XXXX**, Settings > Pages. Then enable GitHub pages to be hosted from the `main` branch and `/docs` directory and click **Save**. The rendered pages should be visible at **user.github.io/RaukR-XXXX**. This can anywhere from a few minutes to 15 mins. 
* Then send a pull request (online) from **your fork (user/RaukR-XXXX)** to (**NBISweden/RaukR-XXXX**) and assign someone as a reviewer.
* When you get back your reviewer's comments, address them and push changes from your **local clone** to **your fork (user/RaukR-XXXX)**.
* The new updates are automatically added to your previous pull request.
* The reviewer accepts and merges the pull request (online). You can also merge it yourself for subsequent pull requests.
* Continue making your materials even better. Create a new pull request when you achieve next milestone.

## Reviewer assignment.

* Assign as reviewer(s) your colleagues who can judge the content.

## As a reviewer.
* You do not need to do all the assignments and run all the code. Just check the slides are not missing or rendering in a wrong way. Also look if something is missing in the content or give suggestions on how to improve it.
* You can work in two ways:
    + clone your colleagues fork, work on her/his presentation slides/lab and pull request the changes that she/he will merge OR
    + just leave the comments in the pull request and let the author know.

## Seeing the content.

If you add to links to your rendered html files to `docs/index.md`, the content can be seen at: https://nbisweden.github.io/RaukR-2021/

## Large files (datasets)
If you have files larger than 100Mb in your materials, e.g. a dataset:

**before** you issue `git add yourlargefile` follow instructions here: https://git-lfs.github.com
