# Technical Documentation

## Getting started

To preview or build the website, we need to use the terminal.

Install Ruby with Rubygems, perferably with a [Ruby version manager][rvm],
and the [Bundler gem][bundler].

In the application folder type the following to install the required gems:

```
bundle install
```

## Making changes

To make changes edit the source files in the `source` folder.

### Single page output

Although a single page of HTML is generated the markdown is spread across
multiple files to make it easier to manage. They can be found in
`source/documentation`.

A new markdown file isn't automatically included in the generated output. If we
add a new markdown file at the location `source/documentation/agile/scrum.md`,
the following snippet in `source/index.html.md.erb`, includes it in the
generated output.

```
<%= partial 'documentation/agile/scrum' %>
```

Including files manually like this lets us specify the position they appear in
the page.

### Multiple pages

To add a completely new page, create a file with a `.html.md` extension in the `/source` directory.

For example, `source/about.html.md` will be accessible on <http://localhost:4567/about.html>.

## Preview

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser. After saving a change the preview in
the browser will automatically refresh.

The preview is only available on our own computer. Others won't be able to
access it if they are given the link.

Type the following to start the server:

```
bundle exec middleman server
```

If all goes well something like the following output will be displayed:

```
== The Middleman is loading
== LiveReload accepting connections from ws://192.168.0.8:35729
== View your site at "http://Laptop.local:4567", "http://192.168.0.8:4567"
== Inspect your site configuration at "http://Laptop.local:4567/__middleman", "http://192.168.0.8:4567/__middleman"
```

You should now be able to view a live preview at http://localhost:4567.

## Building and Deploying

The generated documentation is hosted on the [GOV.UK PaaS][paas].

Deployment is a manual process. First, make sure you have and up-to-date copy
of the repository. Next, you'll need to build the static HTML files:

```
bundle exec middleman build
```

This will create a `build` subfolder in the application folder which contains
the HTML and asset files ready to be published.

To publish the changes, make sure you have the [Cloud Foundry command line
tools][cf-cli] installed, then [sign in to Cloud Foundry][paas-signin], using
the Ireland location.

From the menus that are displayed once you've logged in, select the
`gds-data-gov-uk` organisation, and the `data-gov-uk` space.

Finally, deploy your changes by running:

`cf push -f manifest.yml`

The documentation is cached by CloudFront, so it may take some time for the
updates to appear after deployment.

[rvm]: https://www.ruby-lang.org/en/documentation/installation/#managers
[bundler]: http://bundler.io/
[paas]: https://www.cloud.service.gov.uk/
[cf-cli]: https://docs.cloud.service.gov.uk/get_started.html#set-up-the-cloud-foundry-command-line
[paas-signin]: https://docs.cloud.service.gov.uk/get_started.html#sign-in-to-cloud-foundry
