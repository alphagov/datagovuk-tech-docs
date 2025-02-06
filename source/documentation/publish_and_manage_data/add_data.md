# Add datasets manually

If you do not want to [automatically harvest datasets](../harvest_data), you can add a dataset to data.gov.uk manually.

>You cannot use the form for publishing INSPIRE/Location data. See the guidance on [harvesting INSPIRE data](../inspire) for more information.

Sign into the [Data Publisher](https://ckan.publishing.service.gov.uk/).

1. Go to **Datasets**.
1. Select **Add dataset**.
1. Complete the fields with information about the dataset.
1. Add contact details for the dataset (these will be publicly available to users).
1. Select **Next**.

You can submit 2 sets of contact details per dataset. One set of contact details should be used for Freedom of Information (FOI) requests only.

You can edit the dataset information after it’s published.

Once you have added information about the dataset, you can add the data itself.

1. Select **Add new resource**.
1. Complete the fields.
1. Select **Publish**.

>As a signed in user, you’ll see any new datasets or changes immediately. However, changes may take up to one hour to appear to end users. Please be aware of this when notifying people or announcing releases.

## Publishing organograms

Organograms are a description of the roles and salaries in the UK government at a particular point in time. They are an important publication in the government's effort to improve transparency of how the public sector manages resources.

Central government and agencies must publish organograms of all staff positions on data.gov.uk every 3 months. Organograms are published:

* in a [collection of visualisations](https://data.gov.uk/search?q=organogram)
* as raw data in CSV format

Some organisations, such as intelligence agencies, are exempt from publishing organograms.

Local authorities must publish senior staff data in a [different format](http://schemas.opendata.esd.org.uk/OrganisationStructure).

### When to publish organograms

You must publish the data 4 times a year. Take a ‘snapshot’ of the roles on:

- 31 March to be published by 30 April
- 30 June to be published by 31 July
- 30 September to be published by 30 October
- 31 December to be published by 31 January

### What to include

You must fill in the [standard organogram template](https://ckan.publishing.service.gov.uk/publisher-files/Blank_Organogram_Template_latest.xls) with the details of your department's Senior Civil Service (SCS) pay band 1 and 2 employees.

### Publish an organogram dataset

Follow these instructions if your organisation does not already have an organogram dataset. The instructions help you publish a new dataset containing an organogram. You can then add future organograms to this dataset.

1. Create your organogram using the [standard organogram template](https://ckan.publishing.service.gov.uk/publisher-files/Blank_Organogram_Template_latest.xls).
1. Sign into the [Data Publisher](https://ckan.publishing.service.gov.uk/).
1. Select **Datasets**.
1. Select **Add dataset**.
1. Complete the fields with information about the organogram.
1. Select the appropriate schema for your organogram. Use:
  * **Organisation structure including roles roles & salaries** for central government organograms
  * **Organisation structure (for LGTC by LGA)** for local authority organograms
1. Select **Next**.
1. Upload or link to the organogram and complete the remaining fields.
1. Select **Publish**.
1. If an error message appears, read it carefully as errors should be self-explanatory based on validation rules set in the template spreadsheet. Fix any errors in your spreadsheet and click Publish again.

A new dataset containing the organogram will be created. Add all future organograms for this organisation to this dataset.

### Add an organogram to a dataset

If your organisation already has an organogram dataset, you should add all new organograms to that dataset.

1. Sign into the [Data Publisher](https://ckan.publishing.service.gov.uk/).
1. Select **Datasets**.
1. Search for the organogram dataset of your organisation.
1. Select the dataset.
1. Select **Manage**.
1. Select **Add data**.
1. Select **Add new resource**.
1. Link or upload the data.
1. Select **Publish**.
1. If an error message appears, read it carefully as errors should be self-explanatory based on validation rules set in the template spreadsheet. Fix any errors in your spreadsheet and click Publish again.

The new organogram will be added to the existing dataset.

## Add spend data

Central and local government bodies (including NHS) must publish the details of their expenditure transactions every month. This guidance explains how to add these details to data.gov.uk.

### About spend data

Central government must publish spend data one month in arrears. HM Treasury provides [advice on publishing spend over £25,000](https://www.gov.uk/government/publications/guidance-for-publishing-spend-over-25000), including templates and published examples.

Local government must publish information every month or as soon as it becomes available. The [local government transparency code](https://www.gov.uk/government/publications/local-government-transparency-code-2015) explains what local authorities should publish and when.

### Add new spend data

To add a new dataset, sign into the [Data Publisher](https://ckan.publishing.service.gov.uk/).

1. Find the dataset you want to update.
1. Select **Manage**.
1. Select **Add data**.
1. Select **Add new resource** and add details of the dataset you want to upload.
1. Select **Publish**.

The new data will be added to the existing dataset.

>Each organisation should only have one dataset for spend over £25,000 and another for GPC spend data. Do not create a brand new dataset for each month.
