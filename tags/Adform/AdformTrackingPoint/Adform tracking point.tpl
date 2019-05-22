___INFO___

{
  "displayName": "Adform tracking point",
  "author": "Simo Ahava",
  "description": "The Adform tag template.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "Adform (unofficial)",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "macrosInSelect": false,
    "selectItems": [
      {
        "displayValue": "Standard (JavaScript)",
        "value": "javascript"
      },
      {
        "displayValue": "Iframe",
        "value": "iframe"
      }
    ],
    "displayName": "Tracking type",
    "simpleValueType": true,
    "name": "trackingType",
    "type": "SELECT"
  },
  {
    "help": "Numeric tracking setup ID of Adform client.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "errorMessage": "The tracking ID must be a number.",
        "type": "POSITIVE_NUMBER"
      },
      {
        "errorMessage": "You must provide a valid tracking ID.",
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Tracking ID",
    "simpleValueType": true,
    "name": "trackingId",
    "type": "TEXT",
    "valueHint": "e.g. 123456"
  },
  {
    "displayName": "Page name",
    "name": "pageSettings",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "help": "The default divider is the pipe symbol: |.",
        "simpleValueType": true,
        "name": "overrideDivider",
        "checkboxText": "Use custom divider",
        "type": "CHECKBOX",
        "subParams": [
          {
            "enablingConditions": [
              {
                "paramName": "overrideDivider",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "simpleValueType": true,
            "name": "customDivider",
            "type": "TEXT",
            "valueHint": "e.g. |"
          }
        ]
      },
      {
        "help": "If left unchecked, the tag uses the current page path as the page name.",
        "simpleValueType": true,
        "name": "overridePageName",
        "checkboxText": "Use custom page name",
        "type": "CHECKBOX",
        "subParams": [
          {
            "enablingConditions": [
              {
                "paramName": "overridePageName",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "simpleValueType": true,
            "name": "customPageName",
            "type": "TEXT",
            "valueHint": "e.g. Store|Clothes|Shirts|Sleeveless"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Order variables",
    "name": "orderVariablesGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Standard variables",
        "name": "orderVariables",
        "simpleTableColumns": [
          {
            "selectItems": [
              {
                "displayValue": "Sales",
                "value": "sales"
              },
              {
                "displayValue": "Order ID",
                "value": "orderid"
              },
              {
                "displayValue": "Currency",
                "value": "currency"
              },
              {
                "displayValue": "Basket Size",
                "value": "basketsize"
              },
              {
                "displayValue": "Gender",
                "value": "gender"
              },
              {
                "displayValue": "Age Group",
                "value": "agegroup"
              },
              {
                "displayValue": "Country",
                "value": "country"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "",
            "displayName": "Name",
            "name": "name",
            "isUnique": true,
            "type": "SELECT"
          },
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add variable"
      },
      {
        "displayName": "Custom variables",
        "name": "orderCustomVariables",
        "simpleTableColumns": [
          {
            "valueValidators": [
              {
                "args": [
                  "^(var([1-9]|10)|svn?([1-9]|[1-9][0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5])))$"
                ],
                "errorMessage": "The name must be one of var1...10, sv1...255, svn1...255.",
                "type": "REGEX"
              }
            ],
            "defaultValue": "",
            "displayName": "Name",
            "name": "name",
            "isUnique": true,
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE"
      }
    ]
  },
  {
    "displayName": "Products",
    "name": "productsGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "defaultValue": false,
        "simpleValueType": true,
        "name": "addProducts",
        "checkboxText": "Add products to the hit",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "addProducts",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "Parse the products array from...",
        "simpleValueType": true,
        "name": "parseProductsFrom",
        "type": "RADIO",
        "radioItems": [
          {
            "displayValue": "GTM variable",
            "help": "Parse a valid products array from a GTM variable.",
            "value": "variable",
            "subParams": [
              {
                "macrosInSelect": true,
                "selectItems": [],
                "enablingConditions": [
                  {
                    "paramName": "parseProductsFrom",
                    "type": "EQUALS",
                    "paramValue": "variable"
                  }
                ],
                "simpleValueType": true,
                "name": "productsVariable",
                "type": "SELECT"
              }
            ]
          },
          {
            "displayValue": "Enhanced Ecommerce Data Layer",
            "help": "Parse the products array from an Enhanced Ecommerce Purchase Data Layer object (Product Name, Product ID, Product Sales, Product Category, Product Count).",
            "value": "datalayer"
          }
        ]
      }
    ]
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_adftrack"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_adftrack.push"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "toString.call"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "path",
          "value": {
            "type": 8,
            "boolean": true
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://track.adform.net/serving/scripts/trackpoint/async/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_hidden_iframe",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://track.adform.net/Serving/TrackPoint/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ecommerce.purchase.products"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const callInWindow = require('callInWindow');
const encode = require('encodeUriComponent');
const getUrl = require('getUrl');
const createQueue = require('createQueue');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const injectHiddenIframe = require('injectHiddenIframe');
const copyFromDataLayer = require('copyFromDataLayer');
const makeTableMap = require('makeTableMap');
const makeString = require('makeString');
const makeInteger = require('makeInteger');
const log = require('logToConsole');

// Helper methods
const mergeObj = (obj, obj2) => {
  for (let key in obj2) {
    if (obj2.hasOwnProperty(key)) {
      obj[key] = obj2[key];
    }
  }
  return obj;
};
const isArray = arr => callInWindow('toString.call', arr) === '[object Array]';

// Generate the parameters for the page object
const pm = data.trackingId;
const divider = encode(data.customDivider || '|');
const pageName = encode(data.customPageName || getUrl('path'));
const orderStandardObj = data.orderVariables ? makeTableMap(data.orderVariables, 'name', 'value') : {};
const orderCustomObj = data.orderCustomVariables ? makeTableMap(data.orderCustomVariables, 'name', 'value') : {};
const orderObj = mergeObj(orderStandardObj, orderCustomObj);
let items = [];

// Create the products array
if (data.parseProductsFrom === 'variable' && callInWindow('toString.call', data.productsVariable) === '[object Array]') {
  items = data.productsVariable;
} else if (data.parseProductsFrom === 'datalayer') {
  const eec = copyFromDataLayer('ecommerce.purchase.products') || [];
  items = eec.map(prod => ({
    productname: makeString(prod.name),
    productid: makeString(prod.id),
    productsales: prod.price * prod.quantity,
    categoryname: makeString(prod.category),
    productcount: makeInteger(prod.quantity)
  }));
}
orderObj.itms = items;

if (data.trackingType === 'javascript') {
  
  // Create the global _adftrack queue if it doesn't yet exist
  const _adftrack = copyFromWindow('_adftrack');
  if (!isArray(_adftrack)) {
    setInWindow('_adftrack', _adftrack ? [_adftrack] : [], true);
  }
    
  // Push the page object into _adftrack
  callInWindow('_adftrack.push', {pm: pm, divider: divider, pagename: pageName, order: orderObj});
  
  injectScript('https://track.adform.net/serving/scripts/trackpoint/async/', data.gtmOnSuccess, data.gtmOnFailure, 'asyncadf');
  
}

if (data.trackingType === 'iframe') {
  
  // Create the iframe string string
  const iframeString = 'https://track.adform.net/Serving/TrackPoint/' +
                       '?pm=' + pm +
                       '&ADFPageName=' + pageName +
                       '&ADFdivider=' + divider +
                       '&ADFtpmode=4';
  
  injectHiddenIframe(iframeString, data.gtmOnSuccess, data.gtmOnFailure);
  
}


___NOTES___

Created on 22/05/2019, 09:49:59
