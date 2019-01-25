# Accepted DCAT and data.json fields

When using or data.json, it’s common to use additional fields from other vocabularies. This guidance explains the fields data.gov.uk will accept.

<div style="height:1px;font-size:1px;">&nbsp;</div>

| data.json field | DCAT predicate | Example value | Comments |
| --------------- | -------------- | ------------- | -------- |
| title | dct:title <br> rdfs:label | Spend over £500 | Mandatory |
| description | dct:description <br> rdfs:comment | Spend transactions published monthly according to the Treasury transparency guidelines. | Mandatory |
| identifier | (equivalent to RDF object's URI or) dct:identifier | `https://www.ons.gov.uk/employmentandlabourmarket/peopleinwork/employmentandemployeetypes/timeseries/lf24/lms` or `http://dx.doi.org/10.7927/H4PZ56R2` | Mandatory. A string that identifies the dataset now and in the future, ideally even if the dataset's title changes. If the dataset is in a data catalogue, then supply the URL of the dataset page, or some other catalogue identifier. Or if it is not catalogued already you could assign it a random hexademical string of say 24 digits. Ideally the identifier should be globally unique - not just unique to the organisation - so a URI is highly recommended. |
| license | dct:license | `http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/` or `Open Government Licence` | Mandatory. Either a license URI or a title. If a title, it must be exact or may not be recognized as open. |
| keyword | dcat:keyword | data.json: <br> `"keyword": {"geochemistry", "geology"}` <br> DCAT: `<dcat:keyword>geochemistry</dcat:keyword>` `<dcat:keyword>geology</dcat:keyword>` | Not displayed by data.gov.uk but helps theme categorization |
| issued | dct:issued | `2012-05` | Date the dataset was first published. Formats allowed are: 'YYYY-MM-DD', 'YYYY-MM', 'YYYY' or 'YYYY-MM-DDTHH:MM:SS.mmmmmm' (according to ISO8601) |
| modified | dct:modified | `2012-06-10` | Date the dataset was most recently updated. Formats allowed are: 'YYYY-MM-DD', 'YYYY-MM', 'YYYY' or 'YYYY-MM-DDTHH:MM:SS.mmmmmm' (according to ISO8601) |
| publisher | dct:publisher | data.json: <br> `"publisher": {"name": "Geological Society", "mbox": "info@gs.org"}` <br> DCAT: <br> `<dct:publisher>`<br>`    <foaf:Organization>`<br>`        <foaf:name>Geological Society</foaf:name>`<br>`        <foaf:mbox>info@gs.org </foaf:mbox>`<br>`    </foaf:Organization>`<br>`</dct:publisher>`| Mandatory. However the harvester will attach the dataset to the publisher selected in the harvest source. |
| distribution | dcat:distribution || A location for accessing/obtaining the data. See "Distribution" table below |
| landingPage | dcat:landingPage | `https://www.gov.uk/government/statistical-data-sets/oil-and-petroleum-products-weekly-statistics` | URL of a web page specifically about this dataset and probably has direct links to its resources and further information. |
| references | foaf:Document | `["http://data.dft.gov.uk/road-accidents-safety-data/Brief-guide-to%20road-accidents-and-safety-data.doc"]` <br> OR in data.json you can specify more fields like a distribution, for example <br> `[{"url": "https://indicators.ic.nhs.uk/framework.pdf", "title": "Framework specification", "format": "application/pdf"}]` | URL of a web page, PDF or other documentation that gives more information about the dataset. (Although use landingPage instead for a URL if that is more appropriate.) Should be an array, to allow multiple references to be specified. |
| language | dct:language | `["en"]` or `["http://id.loc.gov/vocabulary/iso639-1/en"]` | Language of the data. Should be an array of values `["en", ...]`.|
| frequency | dct:accrualPeriodicity | `R/P1Y` (=annual) <br> `R/P1W` (=weekly) | The frequency at which dataset is published. Format: ISO 8601 Repeating Duration (or `irregular`) See: <https://project-open-data.cio.gov/iso8601_guidance/#accrualperiodicity> |
| temporal | dct:temporal | `2000-01-15/2000-01-20` `2010-01/2010-03` `2010/2010` | The date period that the dataset applies to. Formatted as two ISO 8601 dates (or datetimes) separated by a slash. If the period in question is a whole year or whole month, just put the same value for start and finish - for example `2010/2010` or `2010-06/2010-06`. |
| spatial |  dct:spatial | `{\"type\":\"Polygon\",\"coordinates\":[[[2.072, 49.943],[2.072, 55.816], [-6.236, 55.816], [-6.236, 49.943], [2.072, 49.943]]]}` | The geographic location that the dataset applies to. If not specified, then it is inherited from the dataset's publisher. Formatted as a GeoJSON point, bounding box or polygon. |
| theme | dcat:theme | `http://eurovoc.europa.eu/209416` - Police - Eurovoc <br> `COFOG/03.1.0` Police services - COFOG <br> `http://id.esd.org.uk/function/20` - Police services - ESD | Main thematic category of the dataset. Preferably expressed as a URI from a known vocabulary: <br> [Eurovoc](http://eurovoc.europa.eu/) <br> [COFOG](https://github.com/datasets/cofog/blob/master/data/cofog.csv) <br> [ESD Service](http://standards.esd.org.uk/?uri=list%2Fservices)/[Function](http://standards.esd.org.uk/?uri=list%2Ffunctions) <br>More than one can be specified using a `[]` list. <br>NB This field is currently ignored by data.gov.uk - use other fields as described in [Themes](theme.html) |

<div style="height:1px;font-size:1px;">&nbsp;</div>

>Local authorities should ensure they add an ESD service or function URI as the dataset's theme, to ensure good classification.

## Distribution

You should use the following fields for datasets not documentation.

<div style="height:1px;font-size:1px;">&nbsp;</div>

| data.json field | DCAT predicate | Example value | Comments |
| --------------- | -------------- | ------------- | -------- |
| downloadURL | dcat:downloadURL | `http://site.gov.uk/river-levels/dec2012.csv` | The direct URL that downloads a file with the data |
| accessURL | dcat:accessURL | `http://www.site.gov.uk/api/sparql` <br> `http://site.gov.uk/river-level-data.html` | If there is not a downloadURL, specify the accessURL, which is the URL of an API or other non-downloadable data. Do not use documentation or other web pages as distributions. |
| title | dct:title | Spend transactions, Dec 2018 |
| description | dct:description | | Not currently displayed on data.gov.uk |
| format | dcat:mediaType | `text/csv` | Currently recognised mime-types are listed here: [DGU formats](https://github.com/datagovuk/ckanext-dgu/blob/master/ckanext/dgu/lib/formats.py#L86) |
| conformsTo | dct:conformsTo | `http://schemas.opendata.esd.org.uk/publictoilets/PublicToilets.json?v=0.41` | URL of the machine-readable schema that the dataset conforms to. Refer to the Local Authority data schemas](xxx). |
| temporal | dct:temporal | `2000-01-15/2000-01-20` `2010-01/2010-03` `2010/2010` | The date period that the dataset applies to. Formatted as 2 ISO 8601 dates (or datetimes) separated by a slash. If the period in question is a whole year or whole month, put the same value for start and finish, for example `2010/2010` or `2010-06/2010-06`. Data.gov.uk only stores the first date of the pair in the "date" field, and if the 2 dates are different, it adds the range into the "name" field. |
| spatial |  dct:spatial | `{\"type\":\"Polygon\",\"coordinates\":[[[2.072, 49.943],[2.072, 55.816], [-6.236, 55.816], [-6.236, 49.943], [2.072, 49.943]]]}` | The geographic location that the dataset applies to. If not specified, then it is inherited from the dataset if not its organisation. Formatted as a GeoJSON point, bounding box or polygon. |
| identifier | (equivalent to RDF object's URI or) dct:identifier | `https://data.some.org/catalog/datasets/9df8df51-63db-37a8-e044-0003ba9b0d98/resource/4252f71c-4f2f-4e37-ab4e-b58b4ac255bb` | Optional. Use it to help CKAN keep track of a distribution that has changing properties (for example, a new URL or format), or for DCAT compliance. Must be globally unique - not just unique to the organisation. A URI is highly recommended (ideally one that returns a web page about the distribution). |

<div style="height:1px;font-size:1px;">&nbsp;</div>

## data.json file structure

The data.json file should be structured as an array `[ ... ]` of dataset objects `{ ... }`.

For example:


```
    [
     {"title": "Live traffic information from the Highways Agency",
      "license": "No license provided",
      "publisher": {"name": "Highways Agency", "mbox": "test@test.com"},
      "distribution": [
        {
          "downloadURL": "https://s3-eu-west-1.amazonaws.com/lmtesting2810/HATRIS_15MinuteMIDAS_YYYY-MM-DD_0.csv.zip",
          "title": "Hatris 15 Min Midas 0",
          "format": "application/zip"
        }]
     },
     {"title": "Roadworks locations",
       ...
     }
    ]
```

Alternatively, you can put this information inside a catalogue object under the key datasets. Although data.gov.uk does not harvest the catalogue data, allowing this structure gives reasonable compatibility with [Project Open Data](https://project-open-data.cio.gov/).

## Character encoding

The data.json file should have ASCII or UTF-8 character encoding (as per the JSON standard). The harvester now detects this and returns an error if the file is not acceptable.

## Namespaces

***NEED TITLES FOR BELOW TABLE***

<div style="height:1px;font-size:1px;">&nbsp;</div>

|TITLE 1|TITLE 2|
|:---|:---|
| dcat | http://www.w3.org/ns/dcat# |
| dct | http://purl.org/dc/terms/ |
| rdfs | http://www.w3.org/2000/01/rdf-schema# |

<div style="height:1px;font-size:1px;">&nbsp;</div>
