#!/usr/bin/env bash
# Usage: ./push.sh <your-github-username>
# Creates a PUBLIC repo "milwaukee-flyer-demo" and pushes these assets. Needs the GitHub CLI (gh auth login).
set -e
USER_NAME="$1"; [ -z "$USER_NAME" ] && { echo "Usage: ./push.sh <github-username>"; exit 1; }
sed -i.bak "s/GITHUB_USER/$USER_NAME/g" products.csv products.json && rm -f *.bak
git init -q && git add . && git commit -qm "Milwaukee flyer demo assets"
git branch -M main
gh repo create milwaukee-flyer-demo --public --source=. --push
echo "Test: https://raw.githubusercontent.com/$USER_NAME/milwaukee-flyer-demo/main/products/2904-22.png"
