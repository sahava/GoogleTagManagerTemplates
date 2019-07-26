___INFO___

{
  "displayName": "Zone",
  "description": "Load Containers on certain pages à la GTM360 Zones",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
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
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "GTM-[A-Z0-9]{5,8}"
        ],
        "type": "REGEX"
      }
    ],
    "displayName": "Container ID",
    "simpleValueType": true,
    "name": "containerId",
    "type": "TEXT",
    "valueHint": "GTM-ABCDEF"
  },
  {
    "displayName": "Advanced Settings",
    "name": "advancedSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "If you have renamed the dataLayer for your root container and want to use the same dataLayer for this container, you need to set that in this field as well. You can use an alternative dataLayer but this is NOT recommended.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "dataLayer Name",
        "defaultValue": "dataLayer",
        "simpleValueType": true,
        "name": "dataLayerName",
        "type": "TEXT"
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
                "string": "https://*.googletagmanager.com/*"
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

//logToConsole - Write values into the developer console - useful for debugging/testing
const log = require('logToConsole');
//injectScript - Inject a script tag onto the page.
const injectScript = require('injectScript');
//Access Tag Text Fields
const containerId = data.containerId;
const dataLayerName = data.dataLayerName;
//If the script loads, log a message and run gtmOnSuccess
const onSuccess = () => {
  log('Zone Loaded');
  data.gtmOnSuccess();
};
// If the script fails, log a message and run gtmOnFailure
const onFailure = () => {
  log('Zone Failed ');
  data.gtmOnFailure();
};
var url = 'https://www.googletagmanager.com/gtm.js?id='+containerId+'&l='+dataLayerName;
injectScript(url,onSuccess,onFailure);


___NOTES___

Created on 25/07/2019, 10:59:05
