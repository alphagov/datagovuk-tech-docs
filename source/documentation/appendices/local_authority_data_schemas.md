# Local Authority data schemas

The Local Government Association (LGA) has released schemas for key datasets, for example Public Toilets and LA Spend Transactions. When publishing metadata on these datasets, Local Authorities should include the URL for the schema that it uses. This allows users to understand the format of the data. It also allows them to do basic validation that the file is formatted correctly.

The schema should be referred to in the metadata by the URL which downloads the schema file (rather than the URL to a web page about the schema, which is not machine-readable.)

1. Browse to the schema page in Firefox or Chrome. For example for Spend data it’s `http://csvchecker.opendata.esd.org.uk/spend`

2. Fill in the form saying what options you have chosen for the fields that have options.

3. Open the developer toolbar and click on the 'Network' tab ( enable it to record the network requests).

4. On the web page select **Validation File"** - ignore the download dialog box

5. In the Network tab you'll get a list of URLs - use the first one. Copy and paste it into the correct field, either "conformsTo" (data.json/DCAT/Inventory) or "schema_url" (CKAN).

It should look similar to:

```http://csvchecker.opendata.esd.org.uk/schema/downloadjsonschema?schemaId=spend&majorVersion=0&requiredFieldIds=```
