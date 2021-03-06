\name{druid.query.segmentMetadata}
\alias{druid.query.segmentMetadata}
\title{Query segment metadata}
\usage{
  druid.query.segmentMetadata(url = druid.url(),
    dataSource, intervals, verbose = F)
}
\arguments{
  \item{url}{URL to connect to druid, defaults to
  druid.url()}

  \item{dataSource}{name of the data source to query}

  \item{intervals}{time period to retrieve data for}

  \item{verbose}{prints out the JSON query sent to Druid}
}
\description{
  Query segment metadata
}

