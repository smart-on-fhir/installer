#!/bin/bash

cd ../repo
git fetch
for v in $(git for-each-ref refs/remotes/origin --format="%(refname:short)" |
    cut -d"/" -f2 |
    grep -v HEAD &&
    git tag);
do
    git checkout $v;
    git pull;
    echo "baseurl: /$v/" > /tmp/_config-$v.yml;
    jekyll build --source . \
                 --destination ../static/$v \
		         --config _config.yml,/tmp/_config-$v.yml;
done
