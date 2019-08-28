___INFO___

{
  "displayName": "Qualaroo",
  "description": "Template for adding the Qualaroo base code on the page.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX1F1YWxhcm9vLVNpbW8tQWhhdmE=",
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
    "help": "Add the account ID number from the Qualaroo script URL. For example, if the script URL is <em>https://s3.amazonaws.com/ki.js/13245/aBC.js</em>, you would type <strong>13245</strong> into this field.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "errorMessage": "",
        "type": "POSITIVE_NUMBER"
      }
    ],
    "displayName": "Account ID",
    "simpleValueType": true,
    "name": "accountId",
    "type": "TEXT"
  },
  {
    "help": "Enter the name of the <strong>.js</strong> file from the Qualaroo script URL that comes after the account ID. For example, if the script URL is <em>https://s3.amazonaws.com/ki.js/13245/aBC.js</em>, you would type <strong>aBC.js</strong> in this field.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "^.+\\.js$"
        ],
        "errorMessage": "The value must be a valid JavaScript library (e.g. aBC.js).",
        "type": "REGEX"
      }
    ],
    "displayName": "Library Name (.js)",
    "simpleValueType": true,
    "name": "jsName",
    "type": "TEXT"
  },
  {
    "simpleValueType": true,
    "name": "gaIntegration",
    "checkboxText": "Add Google Analytics integration",
    "type": "CHECKBOX"
  },
  {
    "enablingConditions": [
      {
        "paramName": "gaIntegration",
        "type": "EQUALS",
        "paramValue": true
      }
    ],
    "valueValidators": [
      {
        "args": [
          "^UA-\\d+-\\d+$"
        ],
        "errorMessage": "The value must be a valid tracking ID (e.g. UA-12345-1).",
        "type": "REGEX"
      }
    ],
    "displayName": "Google Analytics Tracking ID",
    "simpleValueType": true,
    "name": "gaTrackingId",
    "type": "TEXT"
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
                    "string": "_kiq"
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
                    "string": "ga"
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
                    "string": "ga.q"
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
                "string": "https://s3.amazonaws.com/ki.js/*"
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

const createQueue = require('createQueue');
const injectScript = require('injectScript');
const createArgumentsQueue = require('createArgumentsQueue');

const scriptUrl = 'https://s3.amazonaws.com/ki.js/' + data.accountId + '/' + data.jsName;

const gaId = data.gaTrackingId;

createQueue('_kiq');

if (data.gaIntegration) {
  const ga = createArgumentsQueue('ga', 'ga.q');
  ga('create', data.gaTrackingId, 'auto');
}

injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, 'qualaroo');


___NOTES___

Created on 02/08/2019, 11:40:04
