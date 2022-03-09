#' Scroll a webelemt into the view
#'
#' This function allows you to scroll webelements into the view
#' @param rd A Remote Driver Connection to the browser in docker container
#' @param webel A Selenium Webelement
#' @export

scroll_into_view <- function(rd, webel){
  script <- "arguments[0].scrollIntoView(true);"
  rd$executeScript(script, args = list(webel))
  # script <- "var viewPortHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);var elementTop = arguments[0].getBoundingClientRect().top;window.scrollBy(0, elementTop-(viewPortHeight/2));"
  # rd$executeScript(script, args = list(webel))
}
