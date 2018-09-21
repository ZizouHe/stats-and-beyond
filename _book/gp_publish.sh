# shell script to publish github pages version of this book

# save the changes in master branch

git add .
git commit -m "notes finished"
git push origin master

# build the static site
gitbook build

# checkout to the gh-pages branch, if gh-pages is not created, use git checkout -b gh-pages instead
git checkout gh-pages

# pull the latest updates
# git pull origin gh-pages --rebase

# copy the static site files into the current directory.
cp -R _book/* .

# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "notes finished"

# push to the origin
git push origin gh-pages

# checkout to the master branch
git checkout master
