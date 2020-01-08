# Monitoring Kubernetes With Prometheus - Linux Academy course

## Prometheus features
- multi-dimensional data model
- flexible query language (PromQL)
- timeseries collection happens via a pull model over HTTP
- pushing timeseries supported via an intermediary gateway
- targets discovered via service discovery or static configuration
- multiple modes of graphing and dashboarding support

## Exporters
- used to instrument the metrics for an application we don't have source code for

## Expression language data types
In Prometheus's expression language, an expression or sub-expression can evaluate to one of four types:

- **Instant vector** - a set of time series containing a single sample for each time series, all sharing the same timestamp
- **Range vector** - a set of time series containing a range of data points over time for each time series
- **Scalar** - a simple numeric floating point value
- **String** - a simple string value; currently unused

Depending on the use-case (e.g. when graphing vs. displaying the output of an expression), only some of these types are legal as the result from a user-specified expression. For example, an expression that returns an instant vector is the only type that can be directly graphed.

## Recording rules
Recording rules allow you to precompute frequently needed or computationally expensive expressions and save their result as a new set of time series. Querying the precomputed result will then often be much faster than executing the original expression every time it is needed. This is especially useful for dashboards, which need to query the same expression repeatedly every time they refresh.

Recording and alerting rules exist in a rule group. Rules within a group are run sequentially at a regular interval.