___INFO___

{
  "displayName": "Snowplow Settings",
  "description": "Settings for Snowplow Analytics",
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
    "displayName": "Tag Settings",
    "name": "tagSettings",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "alwaysInSummary": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Tracker Name",
        "defaultValue": "snowplow",
        "simpleValueType": true,
        "name": "trackerName",
        "type": "TEXT"
      },
      {
        "alwaysInSummary": true,
        "displayName": "App Id",
        "defaultValue": "website",
        "simpleValueType": true,
        "name": "appId",
        "type": "TEXT"
      },
      {
        "displayName": "Platform",
        "simpleValueType": true,
        "name": "platform",
        "type": "RADIO",
        "radioItems": [
          {
            "displayValue": "Web",
            "value": "web"
          },
          {
            "displayValue": "App",
            "value": "app"
          },
          {
            "displayValue": "Mobile",
            "value": "mob"
          }
        ]
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Collector Address",
        "simpleValueType": true,
        "name": "collectorAddress",
        "type": "TEXT",
        "valueHint": "collector.yourdomain.com"
      },
      {
        "displayName": "Tracker Script URL",
        "simpleValueType": true,
        "name": "trackerJSFileUrl",
        "type": "TEXT",
        "valueHint": "ie. https://d1fc8wv8zag5ca.cloudfront.net/2.10.0/sp.js"
      }
    ]
  },
  {
    "displayName": "Tracker Settings",
    "name": "trackerSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "defaultValue": true,
        "simpleValueType": true,
        "name": "encodeBase64",
        "checkboxText": "Encode Event Data as Base64",
        "type": "CHECKBOX"
      },
      {
        "defaultValue": false,
        "simpleValueType": true,
        "name": "respectDoNotTrack",
        "checkboxText": "Respect Browser 'Do Not Track' Setting",
        "type": "CHECKBOX"
      },
      {
        "displayName": "Cross Domain Linker",
        "simpleValueType": true,
        "name": "crossDomainLinker",
        "type": "TEXT"
      },
      {
        "displayName": "Method Settings",
        "name": "methodSettings",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "defaultValue": true,
            "simpleValueType": true,
            "name": "forceSecureTracker",
            "checkboxText": "Force Secure (https) Tracker",
            "type": "CHECKBOX"
          },
          {
            "help": "The method that the tracker will use to send events.",
            "displayName": "Event Method",
            "defaultValue": "post",
            "simpleValueType": true,
            "name": "eventMethod",
            "type": "RADIO",
            "radioItems": [
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
                "help": "",
                "value": "beacon"
              }
            ]
          },
          {
            "enablingConditions": [
              {
                "paramName": "eventMethod",
                "type": "NOT_EQUALS",
                "paramValue": "beacon"
              }
            ],
            "displayName": "Wait before page unload",
            "defaultValue": 500,
            "simpleValueType": true,
            "name": "pageUnloadTimer",
            "valueUnit": "ms",
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
            "displayName": "Buffer Size",
            "defaultValue": 1,
            "simpleValueType": true,
            "name": "bufferSize",
            "valueUnit": "events",
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
            "displayName": "Maximum POST size",
            "defaultValue": 40000,
            "simpleValueType": true,
            "name": "maxPostBytes",
            "valueUnit": "bytes",
            "type": "TEXT"
          },
          {
            "help": "Useful for getting around some ad blocking software. Send events to a custom path as opposed to the ones used under the hood. You can for example, send requests to a path like '/sp/track' instead of the default '/com.snowplowanalytics.snowplow/tp2'. Must be configured on the collector to work properly.",
            "enablingConditions": [
              {
                "paramName": "eventMethod",
                "type": "NOT_EQUALS",
                "paramValue": "get"
              }
            ],
            "displayName": "POST Path",
            "simpleValueType": true,
            "name": "postPath",
            "type": "TEXT"
          },
          {
            "enablingConditions": [
              {
                "paramName": "postPath",
                "type": "PRESENT",
                "paramValue": ""
              }
            ],
            "displayName": "WARNING: Modifying the POST path requires collector configuration modifications to work properly!",
            "name": "lblPostPathWarning",
            "type": "LABEL"
          }
        ]
      },
      {
        "displayName": "Additional Contexts",
        "name": "contextSettings",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "defaultValue": true,
            "simpleValueType": true,
            "name": "context_webPage",
            "checkboxText": "Web Page",
            "type": "CHECKBOX"
          },
          {
            "defaultValue": false,
            "simpleValueType": true,
            "name": "context_performanceTiming",
            "checkboxText": "Performance / Timing",
            "type": "CHECKBOX"
          },
          {
            "defaultValue": true,
            "simpleValueType": true,
            "name": "context_gaCookies",
            "checkboxText": "Google Analytics Cookies",
            "type": "CHECKBOX"
          },
          {
            "defaultValue": false,
            "simpleValueType": true,
            "name": "context_geoLocation",
            "checkboxText": "Geolocation",
            "type": "CHECKBOX"
          },
          {
            "displayName": "Global Contexts",
            "simpleValueType": true,
            "name": "globalContexts",
            "type": "TEXT"
          }
        ]
      }
    ]
  },
  {
    "displayName": "State / Storage Settings",
    "name": "storageSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "State Storage Method",
        "defaultValue": "localStorage",
        "simpleValueType": true,
        "name": "stateStorageStrategy",
        "type": "RADIO",
        "radioItems": [
          {
            "displayValue": "Local Storage",
            "value": "localStorage"
          },
          {
            "displayValue": "Cookies",
            "value": "cookie"
          },
          {
            "displayValue": "None",
            "value": "none"
          }
        ]
      },
      {
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "type": "NOT_EQUALS",
            "paramValue": "none"
          }
        ],
        "displayName": "Cookie Settings",
        "name": "cookieSettings",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "defaultValue": true,
            "simpleValueType": true,
            "name": "discoverRootDomain",
            "checkboxText": "Discover Root Domain",
            "type": "CHECKBOX"
          },
          {
            "enablingConditions": [
              {
                "paramName": "discoverRootDomain",
                "type": "EQUALS",
                "paramValue": false
              }
            ],
            "displayName": "Cookie Domain",
            "simpleValueType": true,
            "name": "cookieDomain",
            "type": "TEXT"
          },
          {
            "displayName": "Cookie Name",
            "defaultValue": "_sp",
            "simpleValueType": true,
            "name": "cookieName",
            "type": "TEXT"
          },
          {
            "displayName": "Cookie Lifetime",
            "defaultValue": 2678400,
            "simpleValueType": true,
            "name": "cookieLifetime",
            "type": "TEXT"
          }
        ]
      },
      {
        "displayName": "User Fingerprint Settings",
        "name": "userFingerprintSettings",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "defaultValue": false,
            "simpleValueType": true,
            "name": "userFingerprint",
            "checkboxText": "Fingerprint Users",
            "type": "CHECKBOX"
          },
          {
            "enablingConditions": [
              {
                "paramName": "userFingerprint",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "displayName": "Fingerprint Seed",
            "defaultValue": 70307187014,
            "simpleValueType": true,
            "name": "userFingerprintSeed",
            "type": "TEXT"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//const log = require('logToConsole');
//log('data =', data);

const snowplowConfig = data;
const contexts = {
  webPage: snowplowConfig.context_webPage,
  performanceTiming: snowplowConfig.context_performanceTiming,
  gaCookies: snowplowConfig.context_gaCookies,
  geoLocation: snowplowConfig.context_geoLocation  
};

snowplowConfig.contexts = contexts;

return snowplowConfig;


___NOTES___

Created on 9/25/2019, 1:32:47 AM
