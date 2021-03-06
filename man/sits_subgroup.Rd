% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sits_kohonen.R
\name{sits_subgroup}
\alias{sits_subgroup}
\title{Create new groups from kohonen maps}
\usage{
sits_subgroup(koh)
}
\arguments{
\item{koh}{An object with informations about kohonen clustering and samples.}
}
\value{
Returns a sits tibble with subgroups generated by hierarchical clustering.
}
\description{
Create new groups to identify variations in a same group.
}
\author{
Lorena Santos, \email{lorena.santos@inpe.br}
}
