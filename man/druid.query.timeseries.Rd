\name{druid.query.timeseries}
\alias{druid.query.timeseries}
\title{Query time series data}
\usage{
  druid.query.timeseries(url = druid.url(), dataSource,
    intervals, aggregations, filter = NULL,
    granularity = "all", postAggregations = NULL,
    context = NULL, rawData = FALSE, verbose = F, ...)
}
\arguments{
  \item{url}{URL to connect to druid, defaults to
  druid.url()}

  \item{dataSource}{name of the data source to query}

  \item{intervals}{time period to retrieve data for as an
  interval object or list of interval objects}

  \item{aggregations}{list of metric aggregations to
  compute for this datasource}

  \item{filter}{filter specifying the subset of the data to
  extract.}

  \item{granularity}{time granularity at which to
  aggregate}

  \item{postAggregations}{post-aggregations to perform on
  the aggregations}

  \item{context}{query context}

  \item{rawData}{if set, returns the result object as is,
  without converting to a data frame}

  \item{...}{additional parameters to pass to
  druid.resulttodf}

  \item{verbose}{prints out the JSON query sent to druid}
}
\value{
  Returns a data frame where each column represents a time
  series
}
\description{
  Queries druid for timeseries data and returns it as a
  data frame
}
\examples{
\dontrun{

   # Get the time series associated with the twitter hashtag #druid, by hour
   druid.query.timeseries(url = druid.url(host = "<hostname>"),
                         dataSource   = "twitter",
                         intervals    = interval(ymd("2012-07-01"), ymd("2012-07-15")),
                         aggregations = sum(metric("count")),
                         filter       = dimension("hashtag") == "druid",
                         granularity  = granularity("hour"))

   # Average tweet length for a combination of hashtags in a given time zone
   druid.query.timeseries(url = druid.url("<hostname>"),
                         dataSource   = "twitter",
                         intervals    = interval(ymd("2012-07-01"), ymd("2012-08-30")),
                         aggregations = list(
                                           sum(metric("count")),
                                           sum(metric("length")
                                        ),
                         postAggregations = list(
                                           avg_length = field("length") / field("count")
                                        )
                         filter       =   dimension("hashtag") == "london2012"
                                        | dimension("hashtag") == "olympics",
                         granularity  = granularity("PT6H", timeZone="Europe/London"))
  }
}
\seealso{
  \code{\link{druid.query.groupBy}}
  \code{\link{granularity}}
}

