___INFO___

{
  "displayName": "Coveo Analytics Log Event",
  "description": "Logs an analytics event in Coveo Cloud",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFQSURBVFhHxZfRTcMwEIbPLTxUCkJs0IcwABMAm8Ai2GaCsEE6CWUD3qFS2KColXhoKnMBH2qpk8Z2bH9SlPik6P9zvjs5sOK5wOsGEsHWPFf6cTaGjZjIqvpdx2HHABHXiMEAouBTMShqqIsLWS11NAhmA0QEIyN9N8PgnAHwUzh5XfPLOx0dlO4MHPKBr4hMvpV67Y2tAeIFXxJn8n2u1864GiC8jXTXwHGusUaesT7KLz6d6pgVvhn4h/0MGdgAYtm6wxsgehrxrYF2es6QcBk4xDhDYhog9lo33Ba0s/fBETOgKpQW2eNipgM/RDBgFiZCbsFSofAGtldt4g0hMtAIFzWrnxIMIlWOYSsTjGJ7YcK3Bubo/jaTi3vXQ6xrBhphmeBA0t1SLvQ0MLwwcawGevWyD20ZsOplHwwG3FvKhR0DcYX/WD3kPN3vOcA3SzrpBQgaw0IAAAAASUVORK5CYII=",
    "displayName": "",
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
        "displayValue": "Custom",
        "value": "custom"
      },
      {
        "displayValue": "View",
        "value": "view"
      },
      {
        "displayValue": "Detail View",
        "value": "detailView"
      }
    ],
    "displayName": "Event Type",
    "simpleValueType": true,
    "name": "eventType",
    "type": "SELECT"
  },
  {
    "enablingConditions": [
      {
        "paramName": "eventType",
        "type": "EQUALS",
        "paramValue": "view"
      }
    ],
    "displayName": "View Event Metadata",
    "name": "View Event Metadata",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "help": "The name of the field used to trace back the current page in the Coveo Index.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Content ID Key",
        "defaultValue": "permanentid",
        "simpleValueType": true,
        "name": "contentIdKey",
        "type": "TEXT"
      },
      {
        "help": "The value of the field used to trace back the current page in the Coveo Index.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Content ID Value",
        "simpleValueType": true,
        "name": "contentIdValue",
        "type": "TEXT"
      },
      {
        "notSetText": "",
        "help": "(Optional) The type of content being tracked (see <a href=\"https://docs.coveo.com/en/1744/coveo-machine-learning/coveo-machine-learning-recommendation-content-types\">Coveo Machine Learning Recommendation Content Types</a>).",
        "macrosInSelect": true,
        "selectItems": [
          {
            "displayValue": "Articles",
            "value": "articles"
          },
          {
            "displayValue": "Products",
            "value": "products"
          }
        ],
        "displayName": "Content Type",
        "simpleValueType": true,
        "name": "contentType",
        "type": "SELECT"
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "eventType",
        "type": "EQUALS",
        "paramValue": "custom"
      }
    ],
    "displayName": "Custom Event Metadata",
    "name": "Custom Event Metadata",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "help": "",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Event Type",
        "simpleValueType": true,
        "name": "customEventType",
        "type": "TEXT"
      },
      {
        "help": "",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Event Value",
        "simpleValueType": true,
        "name": "customEventValue",
        "type": "TEXT"
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "eventType",
        "type": "EQUALS",
        "paramValue": "detailView"
      }
    ],
    "displayName": "Detail View Event Metadata",
    "name": "Detail View Event Metadata",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "help": "The name of the field used to trace back the current product or variant in the Coveo Index.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Content ID Key",
        "defaultValue": "permanentid",
        "simpleValueType": true,
        "name": "detailContentIdKey",
        "type": "TEXT"
      },
      {
        "help": "The value of the field used to trace back the current product or variant in the Coveo Index.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Content ID Value",
        "simpleValueType": true,
        "name": "detailContentIdValue",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The index field associated to the \"parent\" product ID that regroups all variants of a particular product.",
        "displayName": "Parent ID Key",
        "simpleValueType": true,
        "name": "parentIdKey",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The parent item ID that regroups together all variants of a product.",
        "displayName": "Parent ID Value",
        "simpleValueType": true,
        "name": "parentIdValue",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The price of the item.",
        "displayName": "Price",
        "simpleValueType": true,
        "name": "price",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The price after all discounts have been applied.",
        "displayName": "Discounted Price",
        "simpleValueType": true,
        "name": "discountedPrice",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The amount of time in seconds passed viewing the item.",
        "displayName": "View Duration",
        "simpleValueType": true,
        "name": "viewDuration",
        "type": "TEXT"
      },
      {
        "notSetText": "None",
        "help": "(Optional) Used to provide more information that would explain how the user viewed the details of this product.",
        "macrosInSelect": true,
        "selectItems": [
          {
            "displayValue": "View",
            "value": "view"
          },
          {
            "displayValue": "Quickview (eg: Modal)",
            "value": "quickview"
          },
          {
            "displayValue": "Screenshot",
            "value": "screenshot"
          },
          {
            "displayValue": "Video",
            "value": "video"
          }
        ],
        "displayName": "Action Cause",
        "simpleValueType": true,
        "name": "actionCause",
        "type": "SELECT"
      },
      {
        "help": "(Optional) The name of the product",
        "displayName": "Product Name",
        "simpleValueType": true,
        "name": "name",
        "type": "TEXT"
      },
      {
        "help": "(Optional) A list of categories associated with the product",
        "displayName": "Product Categories",
        "simpleValueType": true,
        "name": "categories",
        "type": "TEXT"
      },
      {
        "help": "(Optional) A list of brands associated with the product",
        "displayName": "Product Brands",
        "simpleValueType": true,
        "name": "brands",
        "type": "TEXT"
      }
    ]
  },
  {
    "displayName": "Document Metadata",
    "name": "Document Metadata",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "help": "The current language of the page's content.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Language",
        "simpleValueType": true,
        "name": "language",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The current URL of the page. If not set, \"window.location\" will be used.",
        "displayName": "Location",
        "simpleValueType": true,
        "name": "location",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The title of the document. If not set, \"document.title\" will be used.",
        "displayName": "Title",
        "simpleValueType": true,
        "name": "title",
        "type": "TEXT"
      },
      {
        "help": "(Optional) Boolean representing whether the current visit is from an anonymous user.",
        "displayName": "Is Anonymous",
        "simpleValueType": true,
        "name": "isAnonymous",
        "type": "TEXT"
      },
      {
        "help": "(Optional) The user name to use to recognize a specific user through multiple visits. Requires an additional \"Impersonate\" privilege on the API Key.",
        "displayName": "Username",
        "simpleValueType": true,
        "name": "username",
        "type": "TEXT"
      },
      {
        "help": "(Optional) A human-friendly user name that will appear in the Usage Analytics reports, replacing the User Name only for display.",
        "enablingConditions": [
          {
            "paramName": "username",
            "type": "PRESENT",
            "paramValue": ""
          }
        ],
        "displayName": "User Display Name",
        "simpleValueType": true,
        "name": "userDisplayName",
        "type": "TEXT"
      }
    ]
  },
  {
    "help": "Custom Data to be sent alongside the event. This data can then be reused in Coveo Cloud",
    "displayName": "Custom Data",
    "name": "Custom Data",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "name": "customDataTable",
        "simpleTableColumns": [
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "",
            "displayName": "Key",
            "name": "key",
            "isUnique": true,
            "type": "TEXT"
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
          },
          {
            "selectItems": [
              {
                "displayValue": "Usage Analytics Reporting",
                "value": "usageanalytics"
              },
              {
                "displayValue": "Machine Learning Context",
                "value": "ml"
              },
              {
                "displayValue": "All",
                "value": "all"
              }
            ],
            "defaultValue": "usageanalytics",
            "displayName": "Purpose",
            "name": "purpose",
            "type": "SELECT"
          }
        ],
        "type": "SIMPLE_TABLE"
      },
      {
        "name": "customDataObjects",
        "simpleTableColumns": [
          {
            "macrosInSelect": true,
            "selectItems": [],
            "valueValidators": [],
            "defaultValue": "",
            "displayName": "Object to merge",
            "name": "object",
            "type": "SELECT"
          },
          {
            "selectItems": [
              {
                "displayValue": "Usage Analytics Reporting",
                "value": "usageanalytics"
              },
              {
                "displayValue": "Machine Learning Context",
                "value": "ml"
              },
              {
                "displayValue": "All",
                "value": "all"
              }
            ],
            "defaultValue": "usageanalytics",
            "displayName": "Purpose",
            "name": "purpose",
            "type": "SELECT"
          }
        ],
        "type": "SIMPLE_TABLE"
      }
    ]
  }
]


___WEB_PERMISSIONS___

[
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
                    "string": "coveoua"
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
                    "string": "coveoua.q"
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
                    "string": "coveoua.t"
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
        "publicId": "get_referrer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
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
        "publicId": "read_title",
        "versionId": "1"
      },
      "param": []
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
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');

const addToObject = function(obj) {
  for (let index in arguments) {
    const obj2 = arguments[index];
    for (let key in obj2) {
      if (obj2.hasOwnProperty(key)) {
        obj[key] = obj2[key];
      }
    }
  }
  return obj;
};

const generateCustomData = () => {
  const ensureObjectHasContextPrefix = (obj) => {
    const contextPrefix = "context_";
    const newObj = {};
    for (let key in obj) {
      const newKey = key.indexOf(contextPrefix) === 0 ? key : contextPrefix + key;
      newObj[newKey] = obj[key];
    }
    return newObj;
  };

  const rowIsForAll = (obj) => obj.purpose === 'all';
  const rowIsForUA = (obj) => obj.purpose === 'usageanalytics' || rowIsForAll(obj);
  const rowIsForML = (obj) => obj.purpose === 'ml' || rowIsForAll(obj);

  const customDataObject = {};

  if (!!data.customDataTable && data.customDataTable.length > 0) {
    const makeSafeTableMap = (table) => {
      const makeTableMap = require('makeTableMap');
      return table ? makeTableMap(table, 'key', 'value') : {};
    };

    const objForUsageAnalytics = makeSafeTableMap(data.customDataTable.filter(rowIsForUA));
    const objForContext = ensureObjectHasContextPrefix(
      makeSafeTableMap(data.customDataTable.filter(rowIsForML))
    );
    addToObject(customDataObject, 
                objForUsageAnalytics,
                objForContext);
  }

  if (!!data.customDataObjects && data.customDataObjects.length > 0) {
    const getValidCustomDataObjectsFromArray = (objects) => {
      return objects.map(row => row.object).filter(obj => typeof obj === 'object');
    };

    getValidCustomDataObjectsFromArray(data.customDataObjects.filter(rowIsForUA))
      .forEach(obj => addToObject(customDataObject, obj));
    getValidCustomDataObjectsFromArray(data.customDataObjects.filter(rowIsForML))
      .map(ensureObjectHasContextPrefix)
      .forEach(obj => addToObject(customDataObject, obj));
  }
  
  return customDataObject;
};

const eventTypeMap = {
  view: "view",
  custom: "custom",
  detailView: "custom"
};

const eventDataForTypeMap = {
  view: {
    contentIdKey: data.contentIdKey,
    contentIdValue: data.contentIdValue,
    customData: {}
  },
  custom: {
    eventType: data.customEventType,
    eventValue: data.customEventValue,
    customData: {}
  },
  detailView: {
    eventType: "detailView",
    eventValue: data.detailContentIdValue,
    customData: {
      contentIdKey: data.detailContentIdKey,
      contentIdValue: data.detailContentIdValue,
      parentIdKey: data.parentIdKey,
      parentIdValue: data.parentIdValue,
      price: data.price,
      discountedPrice: data.discountedPrice,
      viewDuration: data.viewDuration,
      actionCause: data.actionCause,
      name: data.name,
      categories: data.categories,
      brands: data.brands
    }
  }
};

const eventDataForType = eventDataForTypeMap[data.eventType];
addToObject(eventDataForType.customData, generateCustomData());

const getUrl = require("getUrl");
const getReferrerUrl = require("getReferrerUrl");
const readTitle = require("readTitle");
const eventData = {
  location: data.location || getUrl(),
  referrer: data.referrer || getReferrerUrl(),
  language: data.language,
  title: data.title || readTitle(),
  anonymous: data.isAnonymous,
  username: data.username,
  userDisplayName: data.userDisplayName
};

addToObject(eventData, eventDataForType);

log('Coveo Analytics Data =', eventData);

const createArgumentsQueue = require('createArgumentsQueue');
const coveoua = createArgumentsQueue('coveoua', 'coveoua.q');
coveoua("send", eventTypeMap[data.eventType], eventData);

data.gtmOnSuccess();


___NOTES___

Created on 6/5/2019, 1:34:13 PM
