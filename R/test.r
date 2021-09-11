#' A Connection to the Database
#'
#' This function allows you to connect to the MySql Database.
#' @return connectToDb_func() returns an S4 object that inherits from DBIConnection.
#'    This object is used to communicate with the database engine.
#' @export
#' @examples
#' libary(DBI)
#' con <- connectToDb_func()
#' sqlstring <- "SELECT * FROM ConfigCars"
#' df <- dbGetQuery(con, sqlstring)

test <- function(){
  val <- 1+1
  return(val)
}

