# GitHub Action to build and deploy a Jekyll site to GitHub Pages 🧪

This action builds your Jekyll site to `docs/` in the same repository and pushes the changes to `master`.

You can automatically serve your updated site with GitHub Pages by [choosing the `docs/` folder as your source](https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

This action will run `bundle install` and build your site, so please make sure your repository contains all the necessary files for doing so.

For more help, see [Setting up a GitHub Pages site with Jekyll](https://help.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll).

## Add action to your workflow

Here is an example workflow file that uses this action on any `push` event to the `master` branch:

```yml
name: jekyll-cd

on:
  push:
    branches:
      - master

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
      - name: 🛎 Check out master
        uses: actions/checkout@master
        with:
          fetch-depth: 1
      - name: 🧪 Build and deploy
        uses: victoriadrake/jekyll-cd@master
```

## Use the workflow YAML file directly

If you prefer to place this action's YAML file in your repository directly, simply copy the included `jekyll-cd.yml` into your repository's `.github/workflows/` directory.

For help editing the YAML file, see [Workflow syntax for GitHub Actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions).
