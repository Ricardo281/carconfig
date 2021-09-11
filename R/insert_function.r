#' Opens a Database Connection and sends a SQL Statement to the database
#'
#' This function allows you to send a SQL Statement to the database.
#' @param url A string which contains a SQL Statement
#' @export
#' @examples
#' sqlstring <- "SELECT * FROM ConfigCars"
#' insert_function(sqlstring)

insert_function <- function(sqlstring){
  con <- connectToDb_func()
  DBI::dbSendQuery(con,sqlstring)
}
