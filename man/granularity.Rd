\name{granularity}
\alias{granularity}
\title{Creates a Druid query granularity object}
\usage{
  granularity(str = NA, period = NA, duration = NA,
    origin = NA, timeZone = NA)
}
\arguments{
  \item{str}{a string or number representing a granularity
  (e.g. "day", "hour", "minute", "all", "none", 3600,
  "P1M", "PT1H")}

  \item{period}{granularity specified as an ISO period}

  \item{duration}{granularity specified as a duration in
  seconds}

  \item{origin}{timestamp to start computing intervals
  from}

  \item{timeZone}{optional time zone to define period
  granularities specified as a IANA time zone string, e.g.
  "America/Los_Angeles"}
}
\value{
  a Druid granularity object
}
\description{
  Specifies a Druid query granularity using a simple
  string, a numerical duration or an ISO period
}
\details{
  Granularities can be specified in several ways:

  - as a simple string: "day", "hour", "minute", "all",
  "none"

  - as a number, representing the number of seconds in each
  period

  - as an ISO period, such as "P1M", "P1W", PT1H", etc.
}
\examples{
granularity("day")

granularity("PT6H", timeZone="America/Los_Angeles")

granularity(3600 * 2, origin=ymd_hms("2013-01-01T01:00:00"))
}

