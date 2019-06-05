___INFO___

{
  "displayName": "Snowplow Tracker Configuration",
  "description": "The Snowplow Tracker Configuration variable can be used to easily apply a set of tracker configuration parameters to tags created with the Snowplow Analytics tag template.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ],
  "brand": {}
}


___TEMPLATE_PARAMETERS___

[
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


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeInteger = require('makeInteger');

return {
  type: 'snowplow',
  appId: data.appId,
  platform: data.platform,
  respectDoNotTrack: data.respectDoNotTrack,
  userFingerprint: data.userFingerprint,
  userFingerprintSeed: data.userFingerprintSeed,
  stateStorageStrategy: data.stateStorageStrategy,
  cookieDomain: data.cookieDomain !== 'auto' && data.cookieDomain,
  discoverRootDomain: data.cookieDomain === 'auto',
  cookieName: data.cookieName,
  cookieLifetime: data.cookieLifetime !== 'custom' ? data.cookieLifetime : data.customCookieLifetime,
  eventMethod: data.eventMethod,
  encodeBase64: data.encodeBase64,
  pageUnloadTimer: data.pageUnloadTimer,
  forceSecureTracker: data.forceProtocol === 'https',
  forceUnsecureTracker: data.forceProtocol === 'http',
  bufferSize: data.bufferSize,
  postPath: data.postPath,
  maxPostBytes: data.maxPostBytes,
  webPage: data.webPage,
  performanceTiming: data.performanceTiming,
  gaCookies: data.gaCookies,
  geolocation: data.geolocation,
  augurIdentityLite: data.augurIdentityLite,
  optimizelyExperiments: data.optimizelyExperiments,
  optimizelyStates: data.optimizelyStates,
  optimizelyVariations: data.optimizelyVariations,
  optimizelyVisitor: data.optimizelyVisitor,
  optimizelyAudiences: data.optimizelyAudiences,
  optimizelyDimensions: data.optimizelyDimensions,
  optimizelySummary: data.optimizelySummary,
  optimizelyXSummary: data.optimizelyXSummary,
  parrable: data.parrable
};


___NOTES___

Created on 05/06/2019, 14:13:40
