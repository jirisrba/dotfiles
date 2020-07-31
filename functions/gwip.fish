function gwip -d "git commit a work-in-progress branch"
  git status
  git add -A
  git rm (git ls-files --deleted) ^/dev/null
  git commit --no-verify -m "--wip--"
  git pull
  git push --all
end
