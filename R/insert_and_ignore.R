#' Writes a dataframe to the database
#'
#' This function allows you to write the data of dataframe to the database.
#' @param con a connection to the postgres database
#' @param df A dataframe
#' @param tablename A string which contains the name of table in the database
#' @param primarykeycols A vector which contains the names of the Primarykeys
#' @export

insert_and_ignore <- function(con, tablename,primarykeycols,df) {
  # wipe the stage clean
  rs <- DBI::dbSendQuery(con,glue::glue("delete from {tablename}_stage;"))
  DBI::dbClearResult(rs)
  # insert data to stage
  rs <- DBI::dbAppendTable(con, glue::glue("{tablename}_stage"), df)
  # # flip the stage over into final
  rs <- DBI::dbSendQuery(con,glue::glue("insert into {tablename} select * from {tablename}_stage ON CONFLICT ({pk}) DO NOTHING;",
                                        pk = glue::glue_collapse(primarykeycols,",")))
  DBI::dbClearResult(rs)
}



