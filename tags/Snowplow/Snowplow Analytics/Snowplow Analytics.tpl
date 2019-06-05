___INFO___

{
  "displayName": "Snowplow Analytics",
  "description": "Unofficial Snowplow Analytics template",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "Custom Template",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "help": "This is the name of the tracker instance. It is used to distinguish the configuration you have set for one tracker instance from all the other possible tracker instances on the page.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Tracker Name",
    "simpleValueType": true,
    "name": "trackerName",
    "type": "TEXT",
    "valueHint": "e.g. spTracker"
  },
  {
    "help": "Enter the hostname of the collector.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "args": [
          "^[a-z0-9.:]+$"
        ],
        "errorMessage": "The endpoint URL must be a valid hostname.",
        "type": "REGEX"
      }
    ],
    "displayName": "Collector Endpoint",
    "simpleValueType": true,
    "name": "collectorEndpoint",
    "type": "TEXT",
    "valueHint": "e.g. snowplowcollector.cloudfront.net"
  },
  {
    "macrosInSelect": false,
    "selectItems": [
      {
        "displayValue": "Page View",
        "value": "trackPageView"
      },
      {
        "displayValue": "Structured Event",
        "value": "trackStructEvent"
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
        "paramValue": "trackStructEvent"
      }
    ],
    "displayName": "Structured Event Parameters",
    "name": "structEventConfig",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Event Category",
        "simpleValueType": true,
        "name": "structEventCategory",
        "type": "TEXT"
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Event Action",
        "simpleValueType": true,
        "name": "structEventAction",
        "type": "TEXT"
      },
      {
        "displayName": "Event Label",
        "simpleValueType": true,
        "name": "structEventLabel",
        "type": "TEXT"
      },
      {
        "displayName": "Event Property",
        "simpleValueType": true,
        "name": "structEventProperty",
        "type": "TEXT"
      },
      {
        "valueValidators": [
          {
            "args": [
              "^[0-9]+(\\.[0-9]+)?$"
            ],
            "errorMessage": "Event Value must be a float, e.g. 13.5.",
            "type": "REGEX"
          }
        ],
        "displayName": "Event Value",
        "simpleValueType": true,
        "name": "structEventValue",
        "type": "TEXT"
      }
    ]
  },
  {
    "displayName": "Tracker Configuration Parameters",
    "name": "trackerConfiguration",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Tracker Configuration Source",
        "simpleValueType": true,
        "name": "trackerConfigurationOption",
        "type": "RADIO",
        "radioItems": [
          {
            "displayValue": "Use a Snowplow Tracker Configuration Variable",
            "help": "Use the <strong>Snowplow Tracker Configuration</strong> variable type to set the tracker configuration for this tag.",
            "value": "useVariable"
          },
          {
            "displayValue": "Set configuration manually",
            "help": "Edit the tracker configuration directly in this tag.",
            "value": "useTag"
          }
        ]
      },
      {
        "notSetText": "Select a Snowplow Tracker Configuration Variable...",
        "help": "You must only select a variable of type <strong>Snowplow Tracker Configuration</strong> or the tag will not work. You can check the <em>Enable Overriding Configuration In This Tag</em> below to override individual fields of the variable with tag-specific configurations.",
        "macrosInSelect": true,
        "selectItems": [],
        "enablingConditions": [
          {
            "paramName": "trackerConfigurationOption",
            "type": "EQUALS",
            "paramValue": "useVariable"
          }
        ],
        "valueValidators": [
          {
            "errorMessage": "You must choose a Snowplow Tracker Configuration variable.",
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Snowplow Tracker Configuration Variable",
        "simpleValueType": true,
        "name": "trackerConfigurationVariable",
        "type": "SELECT"
      },
      {
        "enablingConditions": [
          {
            "paramName": "trackerConfigurationOption",
            "type": "EQUALS",
            "paramValue": "useTag"
          }
        ],
        "name": "overrideParamsGroup",
        "groupStyle": "NO_ZIPPY",
        "type": "GROUP",
        "subParams": [
          {
            "displayName": "Application Settings",
            "name": "trackerParamsApp",
            "groupStyle": "ZIPPY_OPEN",
            "type": "GROUP",
            "subParams": [
              {
                "help": "See <a href=\"https://github.com/snowplow/snowplow/wiki/1-General-parameters-for-the-Javascript-tracker#221-setting-the-application-id\">here</a> for more information.",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "displayName": "Application ID",
                "defaultValue": "my-site",
                "simpleValueType": true,
                "name": "appId",
                "type": "TEXT"
              },
              {
                "selectItems": [
                  {
                    "displayValue": "Web",
                    "value": "web"
                  },
                  {
                    "displayValue": "Mobile/Tablet",
                    "value": "mob"
                  },
                  {
                    "displayValue": "Desktop/Laptop/Notebook",
                    "value": "pc"
                  },
                  {
                    "displayValue": "Server-Side App",
                    "value": "srv"
                  },
                  {
                    "displayValue": "General App",
                    "value": "app"
                  },
                  {
                    "displayValue": "Connected TV",
                    "value": "tv"
                  },
                  {
                    "displayValue": "Games Console",
                    "value": "cnsl"
                  },
                  {
                    "displayValue": "Internet of Things",
                    "value": "iot"
                  },
                  {
                    "displayValue": "[Custom]",
                    "value": "custom"
                  }
                ],
                "displayName": "Platform",
                "simpleValueType": true,
                "name": "platform",
                "type": "SELECT",
                "subParams": [
                  {
                    "alwaysInSummary": false,
                    "enablingConditions": [
                      {
                        "paramName": "platform",
                        "type": "EQUALS",
                        "paramValue": "custom"
                      }
                    ],
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "displayName": "",
                    "simpleValueType": true,
                    "name": "customPlatform",
                    "type": "TEXT"
                  }
                ]
              }
            ]
          },
          {
            "displayName": "Privacy",
            "name": "trackerParamsPrivacy",
            "groupStyle": "ZIPPY_CLOSED",
            "type": "GROUP",
            "subParams": [
              {
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "displayValue": "True",
                    "value": true
                  },
                  {
                    "displayValue": "False",
                    "value": false
                  }
                ],
                "displayName": "Respect \"Do Not Track\"",
                "simpleValueType": true,
                "name": "respectDoNotTrack",
                "type": "SELECT"
              },
              {
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "displayValue": "On",
                    "value": true
                  },
                  {
                    "displayValue": "Off",
                    "value": false
                  }
                ],
                "displayName": "User Fingerprinting",
                "defaultValue": false,
                "simpleValueType": true,
                "name": "userFingerprint",
                "type": "SELECT"
              },
              {
                "enablingConditions": [
                  {
                    "paramName": "userFingerprint",
                    "type": "EQUALS",
                    "paramValue": true
                  }
                ],
                "displayName": "User Fingerprint Seed",
                "simpleValueType": true,
                "name": "userFingerprintSeed",
                "type": "TEXT"
              }
            ]
          },
          {
            "displayName": "Cookie Settings",
            "name": "trackerParamsCookie",
            "groupStyle": "ZIPPY_CLOSED",
            "type": "GROUP",
            "subParams": [
              {
                "alwaysInSummary": false,
                "selectItems": [
                  {
                    "displayValue": "Cookie",
                    "value": "cookie"
                  },
                  {
                    "displayValue": "Local Storage",
                    "value": "localStorage"
                  },
                  {
                    "displayValue": "None",
                    "value": "none"
                  }
                ],
                "displayName": "State Storage Strategy",
                "simpleValueType": true,
                "name": "stateStorageStrategy",
                "type": "SELECT"
              },
              {
                "help": "Set to <strong>auto</strong> to have Snowplow write the cookie on the root domain.",
                "enablingConditions": [
                  {
                    "paramName": "stateStorageStrategy",
                    "type": "EQUALS",
                    "paramValue": "cookie"
                  }
                ],
                "displayName": "Cookie Domain",
                "defaultValue": "auto",
                "simpleValueType": true,
                "name": "cookieDomain",
                "type": "TEXT"
              },
              {
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "stateStorageStrategy",
                    "type": "EQUALS",
                    "paramValue": "cookie"
                  }
                ],
                "displayName": "Cookie Name",
                "defaultValue": "sp",
                "simpleValueType": true,
                "name": "cookieName",
                "type": "TEXT"
              },
              {
                "selectItems": [
                  {
                    "displayValue": "2 years",
                    "value": 63072000
                  },
                  {
                    "displayValue": "1 year",
                    "value": 31536000
                  },
                  {
                    "displayValue": "6 months",
                    "value": 15552000
                  },
                  {
                    "displayValue": "3 months",
                    "value": 7776000
                  },
                  {
                    "displayValue": "1 month",
                    "value": 2592000
                  },
                  {
                    "displayValue": "7 days",
                    "value": 604800
                  },
                  {
                    "displayValue": "1 day",
                    "value": 86400
                  },
                  {
                    "displayValue": "Session",
                    "value": 0
                  },
                  {
                    "displayValue": "Disable first-party cookie",
                    "value": -1
                  },
                  {
                    "displayValue": "[Custom lifetime]",
                    "value": "custom"
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "stateStorageStrategy",
                    "type": "EQUALS",
                    "paramValue": "cookie"
                  }
                ],
                "displayName": "Cookie Lifetime",
                "simpleValueType": true,
                "name": "cookieLifetime",
                "type": "SELECT",
                "subParams": [
                  {
                    "enablingConditions": [
                      {
                        "paramName": "cookieLifetime",
                        "type": "EQUALS",
                        "paramValue": "custom"
                      }
                    ],
                    "valueValidators": [
                      {
                        "type": "POSITIVE_NUMBER"
                      }
                    ],
                    "simpleValueType": true,
                    "name": "customCookieLifetime",
                    "type": "TEXT"
                  }
                ]
              }
            ]
          },
          {
            "displayName": "Dispatching",
            "name": "trackerParamsHit",
            "groupStyle": "ZIPPY_CLOSED",
            "type": "GROUP",
            "subParams": [
              {
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "displayValue": "POST",
                    "value": "post"
                  },
                  {
                    "displayValue": "GET",
                    "value": "get"
                  },
                  {
                    "displayValue": "Beacon",
                    "value": "beacon"
                  }
                ],
                "displayName": "Dispatch Method",
                "simpleValueType": true,
                "name": "eventMethod",
                "type": "SELECT"
              },
              {
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "displayValue": "True",
                    "value": true
                  },
                  {
                    "displayValue": "False",
                    "value": false
                  }
                ],
                "displayName": "Encode Into Base64",
                "simpleValueType": true,
                "name": "encodeBase64",
                "type": "SELECT"
              },
              {
                "valueValidators": [
                  {
                    "type": "NON_NEGATIVE_NUMBER"
                  }
                ],
                "displayName": "Page Unload Pause Length",
                "defaultValue": 500,
                "simpleValueType": true,
                "name": "pageUnloadTimer",
                "valueUnit": "milliseconds",
                "type": "TEXT"
              },
              {
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "displayValue": "Force HTTPS",
                    "value": "https"
                  },
                  {
                    "displayValue": "Force HTTP",
                    "value": "http"
                  },
                  {
                    "displayValue": "Use page protocol",
                    "value": "none"
                  }
                ],
                "displayName": "Tracker Endpoint Protocol",
                "defaultValue": "none",
                "simpleValueType": true,
                "name": "forceProtocol",
                "type": "SELECT"
              },
              {
                "enablingConditions": [
                  {
                    "paramName": "eventMethod",
                    "type": "NOT_EQUALS",
                    "paramValue": "get"
                  }
                ],
                "valueValidators": [
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "displayName": "Buffer Size",
                "defaultValue": 1,
                "simpleValueType": true,
                "name": "bufferSize",
                "type": "TEXT"
              },
              {
                "enablingConditions": [
                  {
                    "paramName": "eventMethod",
                    "type": "NOT_EQUALS",
                    "paramValue": "get"
                  }
                ],
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "displayName": "POST Path",
                "defaultValue": "/com.snowplowanalytics.snowplow/tp2",
                "simpleValueType": true,
                "name": "postPath",
                "type": "TEXT"
              },
              {
                "enablingConditions": [
                  {
                    "paramName": "eventMethod",
                    "type": "NOT_EQUALS",
                    "paramValue": "get"
                  }
                ],
                "valueValidators": [
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "displayName": "Maximum POST Payload Size",
                "defaultValue": 40000,
                "simpleValueType": true,
                "name": "maxPostBytes",
                "valueUnit": "bytes",
                "type": "TEXT"
              }
            ]
          },
          {
            "displayName": "Predefined Contexts",
            "name": "trackerParamsContexts",
            "groupStyle": "ZIPPY_CLOSED",
            "type": "GROUP",
            "subParams": [
              {
                "simpleValueType": true,
                "name": "webPage",
                "checkboxText": "webPage",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "performanceTiming",
                "checkboxText": "performanceTiming",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "gaCookies",
                "checkboxText": "gaCookies",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "geolocation",
                "checkboxText": "geolocation",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "augurIdentityLite",
                "checkboxText": "augurIdentityLite",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelyExperiments",
                "checkboxText": "optimizelyExperiments",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelyStates",
                "checkboxText": "optimizelyStates",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelyVariations",
                "checkboxText": "optimizelyVariations",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelyVisitor",
                "checkboxText": "optimizelyVisitor",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelyAudiences",
                "checkboxText": "optimizelyAudiences",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelyDimensions",
                "checkboxText": "optimizelyDimensions",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelySummary",
                "checkboxText": "optimizelySummary",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "optimizelyXSummary",
                "checkboxText": "optimizelyXSummary",
                "type": "CHECKBOX"
              },
              {
                "simpleValueType": true,
                "name": "parrable",
                "checkboxText": "parrable",
                "type": "CHECKBOX"
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "displayName": "Advanced Configuration",
    "name": "advancedSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "JavaScript Tracker",
        "name": "trackerGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "help": "This is the global namespace reserved for the Snowplow tracker. <strong>Note!</strong> If you change this from the default \"snowplow\", you must edit template permissions, and change \"snowplow\", \"snowplow.q\", and \"snowplow.q.push\" to match the new global method name.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "displayName": "Global Method Name",
            "defaultValue": "snowplow",
            "simpleValueType": true,
            "name": "globalName",
            "type": "TEXT"
          },
          {
            "defaultValue": true,
            "simpleValueType": true,
            "name": "useHosted",
            "checkboxText": "Use Snowplow-hosted library",
            "type": "CHECKBOX"
          },
          {
            "help": "See <a href=\"https://github.com/snowplow/snowplow-javascript-tracker/releases\">here</a> what the latest version of the tracker is.",
            "valueValidators": [
              {
                "args": [
                  "^[0-9.]+$"
                ],
                "errorMessage": "Must be a valid version number.",
                "type": "REGEX"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "useHosted",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "displayName": "JavaScript Tracker Version",
            "defaultValue": "2.10.2",
            "simpleValueType": true,
            "name": "libVersion",
            "type": "TEXT"
          },
          {
            "help": "Add the URL where your self-hosted Snowplow JavaScript library can be downloaded from. Remember to update <a href=\"https://www.simoahava.com/analytics/custom-templates-guide-for-google-tag-manager/#injects-scripts\"><strong>template permissions</strong></a> to allow script injection requests to this URL.",
            "enablingConditions": [
              {
                "paramName": "useHosted",
                "type": "EQUALS",
                "paramValue": false
              }
            ],
            "valueValidators": [
              {
                "args": [
                  "^https://"
                ],
                "type": "REGEX"
              }
            ],
            "displayName": "Self-hosted Library URL",
            "simpleValueType": true,
            "name": "selfHostedUrl",
            "type": "TEXT"
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
                    "string": "GlobalSnowplowNamespace"
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
                    "string": "snowplow"
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
                    "string": "snowplow.q"
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
                    "string": "_snowplow_trackers"
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
                    "string": "snowplow.q.push"
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
                "string": "https://d1fc8wv8zag5ca.cloudfront.net/*/sp.js"
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
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const callInWindow = require('callInWindow');
const injectScript = require('injectScript');
const makeInteger = require('makeInteger');
const makeTableMap = require('makeTableMap');
const log = require('logToConsole');

// Access the generic settings
const globalName = data.globalName;
const libUrl = data.useHosted ? 'https://d1fc8wv8zag5ca.cloudfront.net/' + data.libVersion + '/sp.js' : data.selfHostedUrl;
const trackerName = data.trackerName;
const endpoint = data.collectorEndpoint;

// Creaete a list of initialized trackers
const trackerListGlobalName = '_snowplow_trackers';
const trackerList = createQueue(trackerListGlobalName);

// Helper to fetch tracker configuration parameters
const getProp = prop => {
  // If using a variable, return the property from that
  if (data.trackerConfigurationVariable) {
    return data.trackerConfigurationVariable[prop];
  }
  // With specific properties, do some custom mapping
  switch (prop) {
    case 'cookieDomain':
      return data[prop] === 'auto' ? undefined : data[prop];
    case 'discoverRootDomain':
      return data.cookieDomain === 'auto';
    case 'cookieLifetime':
      return data[prop] !== 'custom' ? data[prop] : data.customCookieLifetime;
    case 'forceSecureTracker':
      return data.forceProtocol === 'https';
    case 'forceUnsecureTracker':
      return data.forceProtocol === 'http';
  }
  // Otherwise just return the user input
  return data[prop];
};

// Helper that returns a valid tracker configuration object
const getTrackerConfiguration = () => {
  if (data.trackerConfigurationOption === 'useVariable' && data.trackerConfigurationVariable.type !== 'snowplow') {
    return false;
  }
  
  return {
    appId: getProp('appId'),
    platform: getProp('platform'),
    respectDoNotTrack: getProp('respectDoNotTrack'),
    userFingerprint: getProp('userFingerprint'),
    userFingerprintSeed: getProp('userFingerprintSeed'),
    stateStorageStrategy: getProp('stateStorageStrategy'),
    cookieDomain: getProp('cookieDomain'),
    discoverRootDomain: getProp('discoverRootDomain'),
    cookieName: getProp('cookieName'),
    cookieLifetime: getProp('cookieLifetime') && makeInteger(getProp('cookieLifetime')),
    eventMethod: getProp('eventMethod'),
    encodeBase64: getProp('encodeBase64'),
    pageUnloadTimer: getProp('pageUnloadTimer') && makeInteger(getProp('pageUnloadTimer')),
    forceSecureTracker: getProp('forceSecureTracker'),
    forceUnsecureTracker: getProp('forceUnsecureTracker'),
    bufferSize: getProp('bufferSize') && makeInteger(getProp('bufferSize')),
    postPath: getProp('postPath'),
    maxPostBytes: getProp('maxPostBytes') && makeInteger(getProp('maxPostBytes')),
    contexts: {
      webPage: getProp('webPage'),
      performanceTiming: getProp('performanceTiming'),
      gaCookies: getProp('gaCookies'),
      geolocation: getProp('geolocation'),
      augurIdentityLite: getProp('augurIdentityLite'),
      optimizelyExperiments: getProp('optimizelyExperiments'),
      optimizelyStates: getProp('optimizelyStates'),
      optimizelyVariations: getProp('optimizelyVariations'),
      optimizelyVisitor: getProp('optimizelyVisitor'),
      optimizelyAudiences: getProp('optimizelyAudiences'),
      optimizelyDimensions: getProp('optimizelyDimensions'),
      optimizelySummary: getProp('optimizelySummary'),
      optimizelyXSummary: getProp('optimizelyXSummary'),
      parrable: getProp('parrable')
    }
  };
};

// Build the Snowplow global namespace and return the tracker
const getSp = () => {
  const snowplow = copyFromWindow(globalName);
  if (snowplow) {
    return snowplow;
  }

  const globalNamespace = createQueue('GlobalSnowplowNamespace');
  globalNamespace(globalName);
  // Can't use createArgumentsQueue here since the Snowplow tracker library
  // does not work with GTM's wrapper
  setInWindow(globalName, function() {
    callInWindow('snowplow.q.push', arguments);
  });
  createQueue('snowplow.q');
  return copyFromWindow(globalName);
};

const tracker = getSp();
const config = getTrackerConfiguration();
log(config);
if (!config) {
  log('Snowplow: Could not create a proper tracker configuration object.');
  return data.gtmOnFailure();
}

// Only initialize the tracker if it hasn't been initialized yet
if (copyFromWindow(trackerListGlobalName).indexOf(trackerName) === -1) {
  tracker('newTracker', trackerName, endpoint, config);
  trackerList(trackerName);
}

// Send the event to Snowplow
tracker(
  data.eventType,
  data.structEventCategory,
  data.structEventAction,
  data.structEventLabel,
  data.structEventProperty,
  data.structEventValue
);

injectScript(libUrl, data.gtmOnSuccess, data.gtmOnFailure, 'splibrary');


___NOTES___

Created on 05/06/2019, 14:13:33
