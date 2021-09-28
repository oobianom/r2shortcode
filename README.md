# r2shortcode: An R Package that Shortens Other R Packages Functions
### Shorten function names. Make it easier to use.
 Write long descriptive functions in your R package. Users have the choice to use the long form of the function name or shorten the functions using the r2shortcode package.

![](http://coursewhiz.org/mainsite/img/r2shortcode.jpg)


## Quick example in R

` install.packages("r2shortcode") `

` library("r2shortcode") `

### Use this package to shorten the functions in the package "r2dictionary"

` shortenPkg("r2dictionary",addPrefix = T) `

### Index all the short forms of the functions for the package

` index("r2dictionary") `

` help("r2.gP") #OR whatis("r2.gP") `

### How to use function - In this case is the "define" function 

` r2d.d("hello") instead of  r2dictionary::define("hello") `

## Now published on CRAN and also available here in github
View information about this at https://coursewhiz.org/mainsite/r2shortcodes.html

