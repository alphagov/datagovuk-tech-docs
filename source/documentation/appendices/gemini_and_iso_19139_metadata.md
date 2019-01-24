# GEMINI and ISO 19139 metadata

The CSW/WAF/Single-File harvesters all require the records to be in either GEMINI or ISO 19139 format, depending on whether the data is (geo-)spatial or not. Use:

* ISO 19139 for **non-spatial** data
* GEMINI 2.3 for **spatial** data (including INSPIRE datasets)

## ISO 19139

You should make sure ISO 19139 non-spatialdata has a resource type of "nonGeographicDataset", as follows:

```
    <gmd:hierarchyLevel>
      <gmd:MD_ScopeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/gmxCodelists.xml#MD_ScopeCode" codeListValue="nonGeographicDataset">
        nonGeographicDataset
      </gmd:MD_ScopeCode>
    </gmd:hierarchyLevel>
```

Otherwise it will be treated as GEMINI spatial data and you'll get see GEMINI validation errors.

ISO 19139 is an XML schema for the Geographic Metadata (gmd) specification ISO 19115.

You can buy ISO 19139 as a PDF from ISO: [ISO/TS 19139:2007](http://www.iso.org/iso/catalogue_detail.htm?csnumber=32557) or refer to the [ISO19139 XSD schema](https://github.com/datagovuk/ckanext-spatial/tree/dgu/ckanext/spatial/validation/xml/iso19139eden).

When harvested, ISO 19139 records will be validated using two schemas:

* [ISO19139 XSD Schema (EDEN 2009-03-16)](https://github.com/datagovuk/ckanext-spatial/tree/dgu/ckanext/spatial/validation/xml/iso19139eden/gmd) (gmx/gmx.xsd)
* [ISO19139 Table A.1 Constraints Schematron (Medin/Parslow 1.4)](https://github.com/datagovuk/ckanext-spatial/blob/dgu/ckanext/spatial/validation/xml/medin/ISOTS19139A1Constraints_v1.4.sch)

Since ISO 19139 is designed for spatial data, it might seem anachronistic to use it for non-spatial data. However, it’s sometimes useful when using a Geographic Information System to also store both spatial datasets plus a few non-spatial datasets in the same system.

## GEMINI

GEMINI is the UK standard for spatial metadata. It’s based on ISO 19139 and takes into account the needs of INSPIRE too.

There are two key differences with GEMINI compared to ISO 19139:

* the resource type will be 'dataset', 'series' or 'service' (not 'nonGeographicDataset')
* the spatial extent of the data is indicated using a Geographic Bounding Box

Detailed guidance on GEMINI is provided: [UK GEMINI Encoding Guidance](xx)

ISO 19139 and GEMINI2 are similar, but you should validate using the GEMINI2 schematron in your GIS before publishing to data.gov.uk, to spot any issues earlier in the chain.

When harvested, GEMINI records will be validated firstly with the two ISO19139 schemas and then finally with the GEMINI schematron:

* [ISO 19139 XSD Schema (EDEN 2009-03-16)](https://github.com/datagovuk/ckanext-spatial/tree/dgu/ckanext/spatial/validation/xml/iso19139eden/gmd) (gmx_and_srv.xsd)
* [ISO 19139 Table A.1 Constraints Schematron (Medin/Parslow 1.4)](https://github.com/datagovuk/ckanext-spatial/blob/dgu/ckanext/spatial/validation/xml/medin/ISOTS19139A1Constraints_v1.4.sch)
* [GEMINI 2.1 Schematron 1.3](https://github.com/datagovuk/ckanext-spatial/blob/dgu/ckanext/spatial/validation/xml/gemini2/Gemini2_R1r3.sch)
