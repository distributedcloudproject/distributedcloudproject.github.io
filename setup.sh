BLOG=cloudblog

echo "SETTING UP BLOG"
jekyll new $BLOG
mv $BLOG/* .
rm $BLOG
bundle init
bundle install
bundle add github-pages
bundle update
