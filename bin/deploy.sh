#!/bin/bash

bin_dir=$(cd $(dirname $0) && pwd)
root_dir=$bin_dir/..
public_dir=$root_dir/public

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

pushd $root_dir
  hugo -t prologue
popd

pushd $public_dir
  git add -A

  msg="rebuilding site `date`"
  if [ $# -eq 1 ]
    then msg="$1"
  fi
  git commit -m "$msg"

  git push origin master
popd
