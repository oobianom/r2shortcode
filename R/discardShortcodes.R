#' Discard shortcodes
#'
#' This will discard all shorthand functions created and delete them from stores as well. Good if you inadvertently shorthand a package.
#'
#' @param pkg package name
#' @param reflib reference library, preferrably leave unentered
#' @param response TRUE or FALSE, return a response upon completion
#'
#' @export

discardShortcodes = function(pkg,reflib=options()$.funCNamesPkgReference,response=T){
  #prepare the package name
  pkgstorethan = paste0("package:r2shortcode_", pkg)
  #detach if it already exists
  detachlibrarypkg = paste0("detach(", pkgstorethan, ")")
  if((pkgstorethan %in% search())&(!is.null(reflib))){
    eval(parse(text = as.character(detachlibrarypkg)))
    options(".funCNamesPkgReference" = reflib[reflib$pkgName!=pkgstorethan,])
  }else{
   if(response) cat("The package was not shortened previously.\n")
  }

}
