rm -rf .git
git init
cat .gitignore
git status --ignored
git add .
git count-objects -vH
git commit -m "Initial commit"
git count-objects -vH
git remote add origin https://github.com/alejobeap/DEEPVOLC_Workshop.git
git count-objects -vH
git branch -M main
git push -u origin main --force
