library(knitr)
jekyll.draft = function(filename, title='', categories=c(), tags=c()) {
  if ( !file.exists(filename) ) return()
  slug = .sluggify(title)
  
  dr = paste(Sys.getenv('HOME'), '/jekyll', sep='')
  dr = getOption('jekyll.root', default=dr)
  md.filename = paste(slug, '.markdown', sep="")
  
  outp.filename = file.path(dr, '_drafts', md.filename)
  if ( !file.exists(dirname(outp.filename)) ) {
    dir.create(dirname(outp.filename))
  }
  
  .jekyll.write(filename, outp.filename, title, categories, tags)
}

jekyll.post = function(filename, title='', categories=c(), tags=c()) {
  if ( !file.exists(filename) ) return()
  slug = .sluggify(title)
  
  dr = paste(Sys.getenv('HOME'), '/jekyll', sep='')
  dr = getOption('jekyll.root', default=dr)
  
  md.filename = paste(as.character(Sys.Date()), '-', slug, '.markdown', sep="")
  outp.filename = file.path(dr, '_posts', md.filename)
  
  .jekyll.write(filename, outp.filename, title, categories, tags)
}

.sluggify = function(inpt) {
  outp = tolower(inpt)
  outp = gsub('[^\\w\\d]+', '-', outp, perl=T)
  gsub('^-|-$', '', outp, perl=T)
}

.jekyll.write = function(filename, outp.filename, title='', categories=c(), tags=c()) {
  if ( !interactive()  && ( nchar(title) == 0 ) ) return()
  cat(title)
  if ( !nchar(title) ) {
    #TODO: ask for title.
  }
  #TODO: check for tags & categories; ask if not provided.
  
  tmp.dr = dirname(filename)
  tmp.fl = sub('.Rmarkdown$', '.markdown', basename(filename))
  tmp.fl = sub('.Rmd$', '.markdown', basename(tmp.fl))
  tmp.filepath = file.path(tmp.dr, tmp.fl)
  
  dr = paste(Sys.getenv('HOME'), '/jekyll', sep='')
  dr = getOption('jekyll.root', default=dr)
  
  frontmatter = c(paste('title:', title))
  
  if ( length(categories) ) {
    frontmatter = c(frontmatter, 'categories:')
    for ( cat in categories) {
      frontmatter = c(frontmatter, paste(' -', cat))
    }
  }
  
  if ( length(tags) ) {
    frontmatter = c(frontmatter, 'tags:')
    for ( tag in tags) {
      frontmatter = c(frontmatter, paste(' -', tag))
    }
  }
  
  cat('---', frontmatter, '---', sep="\n", file=outp.filename)
  
  knit(filename, tmp.filepath)
  file.append(outp.filename, tmp.filepath)
  c(outp.filename)
}