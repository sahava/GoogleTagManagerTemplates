___INFO___

{
  "displayName": "Facebook Pixel",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0ZhY2Vib29rLVNpbW8tQWhhdmE=",
  "description": "This is an unofficial Google Tag Manager template for the Facebook Pixel.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "Facebook (unofficial)",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "errorMessage": "You must provide a Pixel ID",
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "^[0-9,]+$"
        ],
        "errorMessage": "Invalid Pixel ID format",
        "type": "REGEX"
      }
    ],
    "displayName": "Facebook Pixel ID(s)",
    "simpleValueType": true,
    "name": "pixelId",
    "type": "TEXT",
    "valueHint": "e.g. 12345678910"
  },
  {
    "simpleValueType": true,
    "name": "advancedMatching",
    "checkboxText": "Enable Advanced Matching",
    "type": "CHECKBOX"
  },
  {
    "simpleValueType": true,
    "name": "userProperties",
    "checkboxText": "Enable User Properties",
    "type": "CHECKBOX"
  },
  {
    "alwaysInSummary": true,
    "selectItems": [
      {
        "displayValue": "PageView",
        "value": "PageView"
      },
      {
        "displayValue": "AddPaymentInfo",
        "value": "AddPaymentInfo"
      },
      {
        "displayValue": "AddToCart",
        "value": "AddToCart"
      },
      {
        "displayValue": "AddToWishlist",
        "value": "AddToWishlist"
      },
      {
        "displayValue": "CompleteRegistration",
        "value": "CompleteRegistration"
      },
      {
        "displayValue": "Contact",
        "value": "Contact"
      },
      {
        "displayValue": "CustomizeProduct",
        "value": "CustomizeProduct"
      },
      {
        "displayValue": "Donate",
        "value": "Donate"
      },
      {
        "displayValue": "FindLocation",
        "value": "FindLocation"
      },
      {
        "displayValue": "InitiateCheckout",
        "value": "InitiateCheckout"
      },
      {
        "displayValue": "Lead",
        "value": "Lead"
      },
      {
        "displayValue": "Purchase",
        "value": "Purchase"
      },
      {
        "displayValue": "Schedule",
        "value": "Schedule"
      },
      {
        "displayValue": "Search",
        "value": "Search"
      },
      {
        "displayValue": "StartTrial",
        "value": "StartTrial"
      },
      {
        "displayValue": "SubmitApplication",
        "value": "SubmitApplication"
      },
      {
        "displayValue": "Subscribe",
        "value": "Subscribe"
      },
      {
        "displayValue": "ViewContent",
        "value": "ViewContent"
      },
      {
        "displayValue": "CUSTOM",
        "value": "Custom"
      }
    ],
    "displayName": "Event Name",
    "simpleValueType": true,
    "name": "eventName",
    "type": "SELECT",
    "subParams": [
      {
        "enablingConditions": [
          {
            "paramName": "eventName",
            "type": "EQUALS",
            "paramValue": "Custom"
          }
        ],
        "valueValidators": [
          {
            "errorMessage": "You must provide a Custom Event Name",
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Custom Event Name",
        "simpleValueType": true,
        "name": "customEventName",
        "type": "TEXT"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "consent",
    "displayName": "Consent Granted (GDPR)",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": true,
        "displayValue": "True"
      },
      {
        "value": false,
        "displayValue": "False"
      }
    ],
    "simpleValueType": true,
    "help": "If you set Consent Granted to <strong>false</strong>, the pixel will not send any hits until a tag is fired where Consent Granted is set to <strong>true</strong>. See <a href=\"https://developers.facebook.com/docs/facebook-pixel/implementation/gdpr/\">this article</a> for more information."
  },
  {
    "enablingConditions": [
      {
        "paramName": "advancedMatching",
        "type": "EQUALS",
        "paramValue": true
      }
    ],
    "displayName": "Customer Information Data Parameters",
    "name": "advancedMatchingGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "",
        "name": "advancedMatchingList",
        "simpleTableColumns": [
          {
            "selectItems": [
              {
                "displayValue": "City",
                "value": "ct"
              },
              {
                "displayValue": "Country",
                "value": "country"
              },
              {
                "displayValue": "Date of Birth",
                "value": "db"
              },
              {
                "displayValue": "Email",
                "value": "em"
              },
              {
                "displayValue": "First Name",
                "value": "fn"
              },
              {
                "displayValue": "Gender",
                "value": "ge"
              },
              {
                "displayValue": "Last Name",
                "value": "ln"
              },
              {
                "displayValue": "Phone",
                "value": "ph"
              },
              {
                "displayValue": "State",
                "value": "st"
              },
              {
                "displayValue": "Zip Code",
                "value": "zp"
              }
            ],
            "defaultValue": "",
            "displayName": "Parameter name",
            "name": "name",
            "isUnique": true,
            "type": "SELECT"
          },
          {
            "defaultValue": "",
            "displayName": "Parameter value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add parameter"
      }
    ]
  },
  {
    "displayName": "Object Properties",
    "name": "objectPropertiesGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "type": "SELECT",
        "name": "objectPropertiesFromVariable",
        "displayName": "Load Properties From Variable",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": false,
            "displayValue": "False"
          }
        ],
        "simpleValueType": true,
        "help": "You can use a variable that returns a JavaScript object with the properties you want to use. This object will be merged with any additional properties you add via the table below. Any conflicts will be resolved in favor of the properties you add to the table."
      },
      {
        "displayName": "",
        "name": "objectPropertyList",
        "simpleTableColumns": [
          {
            "valueValidators": [],
            "defaultValue": "",
            "displayName": "Property Name",
            "name": "name",
            "isUnique": true,
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Property Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add property"
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "userProperties",
        "type": "EQUALS",
        "paramValue": true
      }
    ],
    "displayName": "User Properties",
    "name": "userPropertiesGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "valueValidators": [
          {
            "errorMessage": "You must provide a User ID",
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "User ID",
        "simpleValueType": true,
        "name": "userId",
        "type": "TEXT"
      },
      {
        "displayName": "Prefix predefined properties with the $ symbol. Custom properties can only consist of letters, numbers, hyphens, or underscores. See <a href=\"https://bit.ly/2WQ7gkb\">https://bit.ly/2WQ7gkb</a>.",
        "name": "userPropertyLabel",
        "type": "LABEL"
      },
      {
        "valueValidators": [
          {
            "errorMessage": "You must add at least one user property.",
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "",
        "name": "userPropertyList",
        "simpleTableColumns": [
          {
            "valueValidators": [
              {
                "args": [
                  "^([^$]+|\\$(account_created_time|city|country|currency|gender|install_source|language_state|user_type|zipcode))$"
                ],
                "errorMessage": "Invalid predefined user property.",
                "type": "REGEX"
              },
              {
                "args": [
                  "^\\$?[a-zA-Z0-9\\-_]+$"
                ],
                "errorMessage": "Invalid custom user property name.",
                "type": "REGEX"
              },
              {
                "args": [
                  1,
                  40
                ],
                "errorMessage": "Custom user property name too long (max. 40 characters).",
                "type": "STRING_LENGTH"
              }
            ],
            "defaultValue": "",
            "displayName": "Property name",
            "name": "name",
            "isUnique": true,
            "type": "TEXT",
            "valueHint": ""
          },
          {
            "defaultValue": "",
            "displayName": "Property value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add property"
      }
    ]
  },
  {
    "displayName": "More Settings",
    "name": "moreSettingsGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Facebook collects some metadata (e.g. structured data) and user interactions (e.g. clicks) automatically. Check this box to disable this automatic configuration of the pixel.",
        "simpleValueType": true,
        "name": "disableAutoConfig",
        "checkboxText": "Disable Automatic Configuration",
        "type": "CHECKBOX"
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
                    "string": "fbq"
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
                    "string": "_fbq_gtm"
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
                    "string": "_fbq"
                  },
                  {
                    "type": 8,
                    "boolean": false
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
                    "string": "_fbq_gtm_ids"
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
                    "string": "fbq.callMethod.apply"
                  },
                  {
                    "type": 8,
                    "boolean": true
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
                    "string": "fbq.queue.push"
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
                    "string": "fbq.queue"
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
                "string": "https://connect.facebook.net/en_US/fbevents.js"
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
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const createQueue = require('createQueue');
const callInWindow = require('callInWindow');
const aliasInWindow = require('aliasInWindow');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const makeTableMap = require('makeTableMap');
const getType = require('getType');
const log = require('logToConsole');

const initIds = copyFromWindow('_fbq_gtm_ids') || [];
const pixelIds = data.pixelId;

// Helper method
const mergeObj = (obj, obj2) => {
  for (let key in obj2) {
    if (obj2.hasOwnProperty(key)) {
      obj[key] = obj2[key];
    }
  }
  return obj;
};

// Utility function to use either fbq.queue[]
// (if the FB SDK hasn't loaded yet), or fbq.callMethod()
// if the SDK has loaded.
const getFbq = () => {
  // Return the existing 'fbq' global method if available
  let fbq = copyFromWindow('fbq');
  if (fbq) {
    return fbq;
  }
  
  // Initialize the 'fbq' global method to either use
  // fbq.callMethod or fbq.queue)
  setInWindow('fbq', function() {    
    const callMethod = copyFromWindow('fbq.callMethod.apply');
    if (callMethod) {           
      callInWindow('fbq.callMethod.apply', null, arguments); 
    } else {       
      callInWindow('fbq.queue.push', arguments);
    }
  });
  aliasInWindow('_fbq', 'fbq');
  
  // Create the fbq.queue
  createQueue('fbq.queue');
    
  // Return the global 'fbq' method, created above
  return copyFromWindow('fbq');
};

// Get reference to the global method
const fbq = getFbq();

// Build the fbq() command arguments
const userProps = data.userPropertyList ? makeTableMap(data.userPropertyList, 'name', 'value') : {};
const cidParams = data.advancedMatchingList ? makeTableMap(data.advancedMatchingList, 'name', 'value') : {};
const objectProps = data.objectPropertyList ? makeTableMap(data.objectPropertyList, 'name', 'value') : {};
const objectPropsFromVar = getType(data.objectPropertiesFromVariable) === 'object' ? data.objectPropertiesFromVariable : {};
const finalObjectProps = mergeObj(data.objectPropertiesFromVariable, objectProps);
const command = data.eventName !== 'Custom' ? 'trackSingle' : 'trackSingleCustom';
const eventName = data.eventName !== 'Custom' ? data.eventName : data.customEventName;
const uid = data.userId ? {uid: data.userId} : {};
const initObj = mergeObj(uid, cidParams);
const consent = data.consent === false ? 'revoke' : 'grant';

log(finalObjectProps);

fbq('consent', consent);

// Handle multiple, comma-separated pixel IDs,
// and initialize each ID if not done already.
pixelIds.split(',').forEach(pixelId => {
  if (initIds.indexOf(pixelId) === -1) {
    
    // If the user has chosen to disable automatic configuration
    if (data.disableAutoConfig) {
      fbq('set', 'autoConfig', false, pixelId);
    }
    
    // Initialize pixel and store in global array
    fbq('init', pixelId, initObj);
    initIds.push(pixelId);
    setInWindow('_fbq_gtm_ids', initIds, true);
    
    // If the user has added User Properties
    if (data.userProperties) {
      fbq('setUserProperties', pixelId, userProps);
    }
    
  }
  
  // Call the fbq() method with the parameters defined earlier
  fbq(command, pixelId, eventName, objectProps);
});

injectScript('https://connect.facebook.net/en_US/fbevents.js', data.gtmOnSuccess, data.gtmOnFailure, 'fbPixel');


___NOTES___

Created on 18/05/2019, 21:57:16
