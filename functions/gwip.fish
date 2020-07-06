function gwip
  git status
  git add -A .
  git commit --no-verify -m "--wip--"
  git pull
  git push --all
end
