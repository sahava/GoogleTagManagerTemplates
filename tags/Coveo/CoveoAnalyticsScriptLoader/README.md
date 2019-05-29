# Coveo
This is the official loader template for [coveo.analytics](https://github.com/coveo/coveo.analytics.js) script tags.

# Author
Coveo (https://github.com/coveo).

# Release notes
| Date | Notes |
|------|-------|
| 29 May 2019 | First version released. |

# Details

Include this tag in your page to allow push any Coveo Cloud event to the Coveo Usage Analytics service.

Once included, you can send custom events using the following code:

```javascript
coveoua("send", "custom", {
    // event data
});
```