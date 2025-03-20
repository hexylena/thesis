#!/bin/bash
gitrev=$(git rev-list HEAD -n 1 | cut -c 1-8)
gitrevdate=$(git show $gitrev --format="%aI" | head -n 1)
if [[ $(git diff --stat) != '' ]]; then
  state='!'
else
  state='='
fi

echo "\\newcommand{\\gitRev}{$gitrev@$gitrevdate$state}" > vars.tex
echo "\\newcommand{\\gitRevSimple}{$gitrev}" >> vars.tex
