# INSPIRE

INSPIRE places legal obligations on public bodies to publish particular datasets. This requires most UK public bodies (central government, local authorities and all other public authorities as defined in the [Environmental Information Regulations 2004](http://www.legislation.gov.uk/uksi/2004/3391/contents/made)) to publish certain datasets.

Relevant datasets are those which meet all these criteria:

* geo-spatial data (the data points contain a location e.g. latitude/longitude or post code etc)
* data that is in any of the [34 INSPIRE themes](http://inspire.ec.europa.eu/index.cfm/pageid/2/list/7), however UK Location encourages all geo-spatial data to be published the INSPIRE way
* existing data (the law does not compel you to collect any data)

Department for Environment, Food & Rural Affairs (Defra) provides guidance and a helpdesk for INSPIRE queries. Contact the helpdesk at [UK-INSPIRE-Help@defra.gsi.gov.uk](mailto:UK-INSPIRE-Help@defra.gsi.gov.uk).

## Examples INSPIRE data

| Dataset | INSPIRE? | Location? | Explanation |
|---------|----------|-----------|-------------|
| # [River catchment area boundaries](http://data.gov.uk/dataset/water-framework-directive-river-waterbody-catchments-wms) | Yes | Yes | Its publisher Environment Agency is a government agency, the data falls under the INSPIRE theme "Hydrography", and the data is geo-spatial - it can be plotted on a map. |
| # [Road accidents](http://data.gov.uk/dataset/road-accidents-safety-data) | No | Yes | The subject of the data is not covered in the 34 INSPIRE themes so it is not covered by INSPIRE. However the data is Location data - each accident is located using a OS grid reference (and latitude & longitude) so it is geo-spatial. So the publisher could have still published the metadata in GEMINI and provided INSPIRE-style View (WMS) and Download Services (WFS/Atom), but has chosen not to in this case, sticking to basic CSV.|

Local authorities should make use of the detailed guidance from the Local Government Association which lists datasets likely to be held by LAs covered by INSPIRE: [A Guide to INSPIRE compliance in local government (.docx file)](https://www.local.gov.uk/sites/default/files/documents/guide-inspire-compliance--8fe.docx).

## Publishing INSPIRE/Location data

The INSPIRE legislation requires most geo-spatial data to be published according to certain standards, and be registered on data.gov.uk in a certain way. The records must be published in [GEMINI format](../harvest_data/gemini) and be [harvested](../harvest_data). Common ways to do this are:

* metadata records
* storing data in a GIS (Geographic Information System)

### Metadata records

Metadata records are created at the [UK Location Metadata Editor website](https://locationmde.data.gov.uk/). You fill in the web form to create each record and the website publishes them at a 'WAF service' which data.gov.uk harvests. Geographical software is also required to provide the data to users in a way that fulfils the INSPIRE 'View' and 'Download' requirements. For more information, consult the [User Guide to the UK Location Metadata Editor](https://data.gov.uk/sites/default/files/library/Metadata%20Editor%20User%20Guide.pdf)

### Geographic Information System (GIS)

You can choose to store data in a GIS (Geographic Information System). This is common for departments and local authorities that have an established geo-spatial data capability. The most commonly used GIS for data.gov.uk is the open source [GeoNetwork](http://geonetwork-opensource.org/), and commercial ones such as ArcGIS are also in use. The GIS provides a 'WMS service' for users to preview the data and 'WFS service' or 'Atom feed' for users to download the data. The GIS also publishes the metadata records for the datasets at a 'CSW service', which data.gov.uk is then configured to harvest from.

## Harvesting metadata records

Getting your metadata records into data.gov.uk is done by [setting up a data.gov.uk 'harvester'](../harvest_data). You should run the harvester regularly, to ensure that data.gov.uk stays in sync when the publisher updates the records.

Occasionally publishers have made the mistake of using an existing record as a template and simply using a text editor to change the key fields. The main problem with this is that you need to generate a new `gmd:fileIdentifier`, or data.gov.uk will harvest it and overwrite the record that was the template! To generate a new UUID (universally unique identifier) for this field, just visit <https://www.uuidgenerator.net/>.

## Map preview

In order to show the map preview, and the link to the map preview, the metadata needs to:

- Follow the [WMS](https://en.wikipedia.org/wiki/Web_Map_Service) protocol version 1.3.0
- Have resource type set to `service` and not `dataset`
