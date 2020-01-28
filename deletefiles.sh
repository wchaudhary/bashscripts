#!/bin/sh
cd /var/lib/jenkins/jobs/Zoominfo-Github/jobs
for i in *; do
  (
    for j in "$i"/branches/*; do
      echo "Clean $j"
      (
        if [[ $j != *"master"* ]]; then
          cd "$j/builds" && find . -maxdepth 1 -type d -name '*[0-9]*' -mtime +30 | xargs rm -rf {} \;
        elif [[ $j == *"master"* ]]; then
          cd "$j/builds" && find . -maxdepth 1 -type d -name '*[0-9]*' -mtime +60 | xargs rm -rf {} \;
        fi
      )
    done
  )
done
