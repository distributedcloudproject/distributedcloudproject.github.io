# distributedcloudproject.github.io
https://distributedcloudproject.github.io/

This website will use Jekyll (a Ruby package) for generating static HTML.

Making changes
* To change global variables like title, description, or social media handles, modify `_config.yml`.
* To make a new blog post, create a new file with the name `YEAR-MONTH-DAY-TITLE.md` in the `_posts/` directory. Follow the format described here https://jekyllrb.com/docs/posts/.
* To change the homepage modify the `index.html`.
* To change the "about us" page modify `about.md`.

Other
* `_includes/` - contains shared elements for pages, i.e. header, footer.
* `_layouts/` - defines the structure of different page types (page, post, etc).
* `_sass/` and `_css` - contains Sass and CSS files.
* `_js` - contains javascript files.

To test the website locally (Unix)
```
./deps.sh  # for ruby
./setup.sh  # for jekyll
./test.sh  # run jekyll and watch for any changes
```
