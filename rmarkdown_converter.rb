module Jekyll
  class RMarkDownInlineTag < Converter
    safe true
    priority :low
 
    def matches(ext)
        outp = ['.Rmd', '.Rmarkdown'].include?(ext)
        outp
    end
    
    def output_ext(ext)
        ".html"
    end
    
    def convert(content)
        require 'rinruby'
        
        R.eval "require(knitr)"
        R.assign "content", content
        R.eval "content <- (knitr::knit2html(text = content, fragment.only = TRUE))"
        R.pull "content"
    end
  end
end