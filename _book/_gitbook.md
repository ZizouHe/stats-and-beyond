## 将Gitbook发布到Github Pages
```
# install the plugins
npm install -g gitbook-cli

# build the static site
gitbook build

# checkout to the gh-pages branch, if gh-pages is not created, use git checkout -b gh-pages instead
git checkout gh-pages 

# pull the latest updates
git pull origin gh-pages --rebase

# copy the static site files into the current directory.
cp -R _book/* .

# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update docs"

# push to the origin
git push origin gh-pages

# checkout to the master branch
git checkout master

# then check with http://ZizouHe.github.io/CODE
```

[查看Github Pages](http://ZizouHe.github.io/CODE)

## 本地阅读Gitbook

```
# Download the Calibre application. 
# After moving the calibre.app to your Applications folder, 
# create a symbolic link to the ebook-convert tool:
$ export PATH=/Applications/calibre.app/Contents/MacOS:$PATH
```

```
# html with localhost
$ gitbook serve

# Generate a PDF file
$ gitbook pdf ./ ./mybook.pdf

# Generate an ePub file
$ gitbook epub ./ ./mybook.epub

# Generate a Mobi file
$ gitbook mobi ./ ./mybook.mobi
```

## plugins

在创建的book.json中加入

```
{
    "plugins": ["mathjax"]
}
```

然后在命令行中运行

```
$ gitbook install
```

