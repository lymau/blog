#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Genterate file statis
hugo -t hugo-theme-stack~ # if using a theme, replace by `hugo -t <yourtheme>`

# pindah ke direktoru publik
cd public
# tambahkan perubahan ke Git
git add -fA

# Buat sebuah commit baru
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push atau puload ke Github
git push origin master

# Balik ke direktori sebelumnya
cd ..