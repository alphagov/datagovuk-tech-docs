# API documentation

The data.gov.uk directory API uses the [CKAN API and its extensions](https://docs.ckan.org/en/2.9/api/index.html). [Curated collections](https://data.gov.uk) are not yet available via the API. [Check out the roadmap](https://data.gov.uk/roadmap) to learn more about upcoming changes to data.gov.uk.

You do not need an API key to use the API and there are no rate limits.

To call the API, post a JSON dictionary in a HTTP POST request to one of the data.gov.uk API URLs. The base URL for all calls is `https://data.gov.uk/api/action/`.

In CKAN vocabulary, `packages` refers to ‘datasets’.

For example calls using curl and parameters see the [CKAN API documentation](https://ckan.readthedocs.io/en/latest/api/index.html).

### Get datasets and publisher information

This table lists the parameters and returns with example URLs.

| Parameter                            | Returns                    | Example URL |
|--------------------------------------|----------------------------|-------------|
| # `package_list`                     | List of datasets           | https://data.gov.uk/api/action/package_list |
| # `package_show?id=<PUBLISHER-NAME>` | Information about a single dataset | https://data.gov.uk/api/action/package_show?id=cabinet-office-energy-use |

### Search datasets

Use `package_search` to search datasets.

SOLR provides the parameters for search calls. For example parameters, see the [SOLR documentation](https://lucene.apache.org/solr/guide/7_6/common-query-parameters.html).

The number of results returned defaults to 10. Use a `rows` parameter to change this.

| Parameter | Action          | Example URL                                    |
|-----------|-----------------|------------------------------------------------|
| # `q`     | Free text query | https://data.gov.uk/api/action/package_search?q=fish |
| # `fq`    | Data by field   | https://data.gov.uk/api/action/package_search?fq=organization:peterborough-city-council |
| # `rows`  | Max rows to return  | https://data.gov.uk/api/action/package_search?fq=organization%3Acabinet-office&rows=200 |

Remember to escape these URLs. Most browsers will escape these automatically when you open these example links, but some clients, such as Python, will mostly need them URL encoded (spaces to `%20` etc). And on the command-line remember to quote the whole URL, for example use single quotes:

```
curl 'https://data.gov.uk/api/action/package_search?fq=organization:peterborough-city-council'
```

### Get publisher information

Data.gov.uk uses CKAN `organizations` to store what is shown as ‘publishers’ on the frontend.

| Parameter                                 | Returns                              | Example URL |
|-------------------------------------------|--------------------------------------|-------------|
| # `organization_list`                     | List of publishers                   | https://data.gov.uk/api/action/organization_list |
| # `organization_show?id=<PUBLISHER-NAME>` | Information about a single publisher | https://data.gov.uk/api/action/organization_show?id=cabinet-office&include_datasets=false |


For requests and questions about a dataset on the [the data.gov.uk directory](https://data.gov.uk/search), you should contact the publisher directly if they’ve provided their contact details next to the dataset.
