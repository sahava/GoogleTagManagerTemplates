# Coveo
This template allows to log a Coveo Analytics events using a [coveo.analytics](https://github.com/coveo/coveo.analytics.js) script on the page.

# Author
Coveo (https://github.com/coveo).

# Release notes
| Date | Notes |
|------|-------|
| 29 May 2019 | First version released. |
| 06 June 2019 | Added `Detail View` event type, allow to add context data, and allow to configure the username. |

# Details

First, ensure that you have loaded the Coveo Analytics Script. With either:

* The official [CoveoAnalyticsScriptLoader](https://github.com/sahava/GoogleTagManagerTemplates/tree/master/tags/Coveo/CoveoAnalyticsScriptLoader)  custom tag (Recommended)
* The [coveo.analytics](https://github.com/coveo/coveo.analytics.js) snippet included in your page.

Then, use this template to create a tag to log events into the Coveo Usage Analytics service.

The following types of event are supported:

* View
* Custom
* Detail View
