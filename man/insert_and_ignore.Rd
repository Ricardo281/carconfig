% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/insert_and_ignore.R
\name{insert_and_ignore}
\alias{insert_and_ignore}
\title{Writes a dataframe to the database}
\usage{
insert_and_ignore(con, tablename, primarykeycols, df)
}
\arguments{
\item{con}{a connection to the postgres database}

\item{tablename}{A string which contains the name of table in the database}

\item{primarykeycols}{A vector which contains the names of the Primarykeys}

\item{df}{A dataframe}
}
\description{
This function allows you to write the data of dataframe to the database.
}
