This project provides two methods for embedding RMarkdown documents in Jekyll:

rmarkdown_converter.rb
======================
A Jekyll plugin that provides an Rmarkdown "converter," so you can write your posts in RMarkdown and save them in your site's `_drafts` or `_posts` directory with the extension `Rmd` or `Rmarkdown`.

To install, simply save rmarkdown_converter.rb in your jekyll `_plugins` directory. You'll also need to install `rinruby`, probably [from RubyGems](http://rubygems.org/gems/rinruby): 

```
gem install rinruby
```

This code borrows heavily from the sample converter on the [Jekyll plugins documentation page](http://jekyllrb.com/docs/plugins/) and [this post by Simon Elliston Ball](http://www.simonellistonball.com/technology/embedding-rmarkdown-in-jekyll-blog/).

jekyll.R
========
Provides two R functions intended for use from the RStudio console. Both expect `options('jekyll.root')` to contain a reference to the root of your Jekyll blog (the directory that contains `_posts`):

`jekyll.draft(filename, title='', categories=c(), tags=c())`  
`knit()`s the file at `filename`, prepends [YAML front-matter](http://jekyllrb.com/docs/frontmatter/) for the title, categories and tags (if present), and saves the output in your blog's `_drafts` directory with a filename based on the provided title.

Currently, `title`, `categories`, and `tags` must be provided in the function call, e.g.:
```
jekyll.draft('mypost.Rmarkdown', 'This is my post', c('R', 'statistics'), c('blogging', 'jekyll'))
```

`jekyll.post(filename, title='', categories=c(), tags=c())`  
Same as `jekyll.draft()` but prepends the current date to the filename and places the output in your blog's `_posts` directory.