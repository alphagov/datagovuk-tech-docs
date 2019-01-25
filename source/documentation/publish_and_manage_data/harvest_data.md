# Harvest data

To use the data.gov.uk harvester, you must publish the datasets on the internet and then set up the harvester.

1. Create a metadata record for the data.
1. Publish the metadata record in a supported format.
1. Set up the harvester.
1. Test the harvest.

## Create a metadata record

To use the data.gov.uk harvester, you must host the dataset publicly on the internet for the harvester to find.

You must describe each dataset in a ‘metadata record’ and give information about the dataset such as:

* title
* description
* link to download the data file

The harvester will display the title and description from the metadata record on data.gov.uk. This information helps users find data so make sure you [use popular keywords](https://www.gov.uk/guidance/content-design/data-and-analytics#how-to-optimise-your-content-for-search).

### Complete the title field

Use [plain English](https://www.gov.uk/guidance/content-design/writing-for-gov-uk#how-people-read) terms where possible and put the information the user is most likely to search for at the start of the title. The title should be no more than 65 characters including spaces.

Do not include the name of the publishing organisation, for example `Car parks` rather than `Brent Council car parks`.

### Complete the description field

Along with the title, the first sentence of the description will be shown in search results. This sentence should be 140 characters or less. Search engines will automatically shorten any descriptions that are longer than this.

The description should explain:

* what the data is about
* why it was produced
* if there are any known problems with the dataset, for example if it’s incomplete

Write your description in [plain English](https://www.gov.uk/guidance/content-design/writing-for-gov-uk#how-people-read). Include any keywords that you didn’t use in the title to help users find your dataset.

## Publish the metadata record

You must publish the metadata records on the internet in one of the following formats.

<div style="height:1px;font-size:1px;">&nbsp;</div>

| Format                               | Suitable for                                   | INSPIRE/Location data | Example harvest URL                                        |
|--------------------------------------|---------------------------------------------|-----------------------|------------------------------------------------------------|
| DCAT                                 | Triple-stores                               | No                    | http://opendatacommunities.org/data.ttl                    |
| data.json                            | Socrata, custom systems                     | No                    | https://nycopendata.socrata.com/data.json                  |
| CKAN                                 | CKAN                                        | No                    | https://open.barnet.gov.uk/                                |
| Inventory                            | DataShare                                   | No                    | http://data.bracknell-forest.gov.uk/api/esdInventory       |
| GEMINI - CSW Server                  | GeoNetwork, ArcGIS                          | Yes                   | http://metadata.bgs.ac.uk/geonetwork/srv/en/csw            |
| GEMINI - Web Accessible Format (WAF) | UK Location Metadata Editor, custom systems | Yes                   | http://www.ordnancesurvey.co.uk/oswebsite/xml/products     |
| GEMINI - single file                 | Test data                                         | Yes                   | https://itportal.decc.gov.uk/web_files/gis/xml/DECC_ON.xml |

<div style="height:1px;font-size:1px;">&nbsp;</div>

If a dataset falls under the [INSPIRE regulation](xxx), you must publish the data set in a GEMINI format. You can also publish other geo-spatial/location data in the GEMINI format. But you must not use GEMINI for data that has no location element.

### DCAT/data.json fields

When using [DCAT](https://www.w3.org/TR/vocab-dcat/), it’s common to use additional fields or predicates from other vocabularies. Data.gov.uk will accept [additional fields or predicates](xxx) from other vocabularies.

DCAT is suitable for linked data systems, but you may find data.json is more suitable for simple datasets. The data.json format has the fields data.gov.uk needs from DCAT, but removes the namespace prefixes and uses the well-known JSON syntax. This has the benefits of DCAT but is generally easier to produce.  

Although CKAN supports DCAT for the core fields, it is recommended to harvest from a CKAN using the CKAN harvester. This is because custom fields often do not map well to DCAT fields and can vary from portal to portal.

You must give the harvester the URL that returns the RDF for all the datasets. You can split the datasets into a number of pages, accessed using the ‘page’ parameter. For example, access page 2 by appending `?page=2` to the URL.

### data.json

The data.json format has the [same fields as DCAT](xxx), but expresses them more simply.

You must give the harvester the URL that returns a JSON list containing the datasets. You can split the datasets into a number of pages, accessed using the ‘page’ parameter. For example, access page 2 by appending `?page=2` to the URL.

### CKAN files

Comprehensive Knowledge Archive Network (CKAN) is an web-based open source management system for storing and distributing open data. Data.gov.uk uses CKAN version 2.7.

The CKAN harvester needs the URL of the CKAN home page, from where the harvester can find API functions.

Data.gov.uk accepts most common CKAN fields, but has some customisations. For more information, refer to:

* the [guidance on accepted CKAN fields](link)
* official [CKAN documentation](https://docs.ckan.org/en/2.7/)

### Inventory

Created for the Local Government Association (LGA), the Inventory format is only suitable for local authority data. DataShare created the format and ESD provides an [XML schema](http://schemas.opendata.esd.org.uk/Inventory) which will check if there are any errors in the inventory before it is harvested.  

The data.gov.uk harvester needs the full URL for the inventory XML file to work.

Refer to the [Inventory documentation for more information](http://schemas.esd.org.uk/inventory/InventoryGuidance.pdf).

### CSW Server (GEMINI)

[Catalog Service for the Web (CSW)](https://en.wikipedia.org/wiki/Catalog_Service_for_the_Web), is an open standard by the OGC, for exposing geo-spatial metadata on the web. It’s full of features and complexity, so is most suitable for GIS systems like [GeoNetwork](http://geonetwork-opensource.org/) or ArcGIS.

While you can publish non-spatial data with CSW, data.gov.uk currently only accepts
GEMINI metadata which does not support non-spatial data.

Data.gov.uk and INSPIRE use CSW version 2.0.2.

CSW allows datasets in several XML-based formats, but data.gov.uk requires datasets in GEMINI/ISO19139 format.

For more information, see the:

* guidance on [GEMINI and ISO 19139 metadata](xxx)
* [Discovery Metadata Service Collection Information Specification (PDF)](https://guidance.data.gov.uk/static/DMS_Collection_Interface_Specification_10.pdf)

### Web Accessible Folder (WAF) (GEMINI)

A WAF is a web page with links to GEMINI/ISO19139 XML files. This means you can place your XML files in a folder on your server and tell Apache to serve it with a directory listing.

However, the HTML must not have a path specified in it. The XML files must be at the same path (folder) as the HTML page. This allows you to have other links on the web page, such as to your home page, which the harvester ignores.

For example, the source of the WAF web page may look similar to the following:

```
<html>
 <body>
  <a href="rivers.xml"/>
  <a href="fish-population.xml"/>
  <a href="nitrogen-levels.xml"/>
 </body>
</html>
```

Make sure the links do not have a path (have slashes) like this:

```
  <a href="/data/rivers.xml"/>
```

Refer to the [Discovery Metadata Service Collection Information Specification (PDF)](https://guidance.data.gov.uk/static/DMS_Collection_Interface_Specification_10.pdf) for more information about WAF.

data.gov.uk requires the metadata is in GEMINI/ISO19139 format. For more information, see [GEMINI and ISO 19139 metadata](xxx).

### Single File (GEMINI)

If you only have one dataset record to publish, or want to test a record without putting it in a CSW or WAF, you can point the harvester directly at the URL that returns the GEMINI/ISO19139 record (XML file).

Data.gov.uk requires the metadata is in GEMINI/ISO19139 format. For more information, see [GEMINI and ISO 19139 metadata](link).

## Set up the harvester

To set up the harvester, you need sign into data.gov.uk with an editor or admin account and have published the dataset(s) somewhere publicly.

1. Once you’re signed into data.gov.uk select **Harvest**.
1. The page will show all current harvests. Select **Add Harvest Source**.
1. Add the URL to the dataset you want to harvest and complete the fields.
1. Choose how often you want to harvest the dataset by selecting **Update frequency**.
1. Select **Save**.

## Test the harvester

To check if the harvester is working correctly, you can review information about when a dataset was last harvested, the specific harvester jobs, and any errors that may have occurred.

1. Sign into the [Data Publisher](https://ckan.publishing.service.gov.uk/).
1. Select **Harvest**.
1. Select the dataset you want to check.
1. Select **Manage**.

From the next page you can:

* view the source of the harvest
* trigger a reharvest
* view the harvest jobs and any errors
* view a full report of all harvest jobs
* edit the dataset information including the harvest frequency
