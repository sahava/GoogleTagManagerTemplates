# Adform Tracking Point
This is an **unofficial** tracking point implementation for [Adform](https://support.adform.com/documentation/implement-tracking-points/standard-javascript/unique-naming/).

# Author
Simo Ahava (https://www.simoahava.com/).

# Release notes
| Date | Notes |
|------|-------|
| 22 May 2019 | First version of the template released. |

# Details
The template supports the [JavaScript](https://support.adform.com/documentation/implement-tracking-points/standard-javascript/unique-naming/) and [iframe](https://support.adform.com/documentation/implement-tracking-points/iframe/unique-naming/) implementation methods.

Features:

1. **Manually set `pagename` and `divider`**, or use the defaults (document path and `|`, respectively).

2. **Add either standard or custom order variables**. Standard variables are added with a drop-down list, and custom variables with a free text field, where a regex checks if the variable name is valid (`var1...10`, `sv1...255`, or `svn1...255`).

3. **Parse the products array from a GTM variable of from an Enhanced Ecommerce Purchase object in the Data Layer**. You can use any GTM variable that returns a [valid `items` array](https://support.adform.com/documentation/implement-tracking-points/standard-javascript/variables/), or you can have the template parse the [`ecommerce.purchase.products`](https://www.simoahava.com/analytics/enhanced-ecommerce-guide-for-google-tag-manager/#data-layer-composition-5) array into **Product Name**, **Product ID**, **Product Sales**, **Product Category**, and **Product Count** properties automatically.