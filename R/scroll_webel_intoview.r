#' Scroll a webelemt into the view 
#'
#' This function allows you open the browser with a specific url and sets the  
#' Pageload/Implicit timeout. There is a option that cookie will be clicked.
#' @param rD A Remote Driver Connection to the browser in docker container
#' @param webel A Selenium Webelement
#' @export
#' @examples
#' url <- "https://www.hyundai.ch/"
#' remDr <-  prepare_browser_function(url,"id","onetrust-reject-all-handler", containerport = 4445L)
#' webelement <- remDr$findElement(using = "class", "menu")
#' scroll_webel_intoview(remDr, webelement)

scroll_webel_intoview <- function(rD, webel){
  script <- "var viewPortHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);var elementTop = arguments[0].getBoundingClientRect().top;window.scrollBy(0, elementTop-(viewPortHeight/2));"
  rD$executeScript(script, args = list(webel))
}
get