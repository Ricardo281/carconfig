#' Open and Prepare Browser in Docker Container
#'
#' This function allows you open the browser with a specific url and sets the  
#' Pageload/Implicit timeout. There is a option that cookie will be clicked.
#' @param url A string which contains a url
#' @param using_arg A string which contains the Locator Scheme. As Example 'css selector', 'xpath',etc.
#' @param search_arg A string which contains the search term like a xpath
#' @param containerport A integer which identfies the Docker Container Port
#' @param duration A integer to specify the timeout duration
#' @return A RemoteDriver Connection to the prepared Broswer
#' @export
#' @examples
#' url <- "https://www.audi.ch/ch/web/de/neuwagen.html"
#' remDr <- prepare_browser_function(url,"id","onetrust-accept-btn-handler",containerport = 4445L)

prepare_browser_function <- function(url,using_arg, search_arg, containerport, duration =10000){
  remDr <- RSelenium::remoteDriver(
    remoteServerAddr = "host.docker.internal",
    port = containerport, browser = "chrome")
  remDr$open(silent = TRUE)
  remDr$setTimeout(type = "implicit",milliseconds = duration)
  remDr$setTimeout(type = "pageload",milliseconds = duration)
  remDr$navigate(url)
  if(!missing(using_arg) & !missing(search_arg)){
    cookie <- remDr$findElement(using = using_arg ,search_arg)
    cookie$clickElement()
  }
  
  return(remDr)
}
