___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "String from array of objects",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX1N0cmluZy1mcm9tLWFycmF5LW9mLW9iamVjdHMtU2ltby1BaGF2YQ==",
  "description": "Create a concatenated string of a key in an array of objects.",
  "containerContexts": [
    "WEB"
  ],
  "brand": {}
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "helpText",
    "displayName": "Use this variable to turn an array of objects (e.g. <strong>[{id: '123', name: 'first'},{id: '234', name: 'second}]</strong>) into a string (e.g. <strong>'123,234'</strong>)."
  },
  {
    "type": "SELECT",
    "name": "inputArray",
    "displayName": "Input array",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "keyToConcatenate",
    "displayName": "Object property",
    "simpleValueType": true,
    "help": "Choose a key that can be found in the objects within the array. The values of this key will be used to create the string.",
    "valueHint": "e.g. id",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "delimiter",
    "displayName": "Delimiter",
    "simpleValueType": true,
    "help": "Choose a delimiter symbol or string used to separate each value in the string.",
    "defaultValue": ",",
    "alwaysInSummary": true
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

const callInWindow = require('callInWindow');
const log = require('logToConsole');

// Helper method
const isArray = arr => callInWindow('toString.call', arr) === '[object Array]';

const inputArray = data.inputArray;
const keyToConcatenate = data.keyToConcatenate;
const delimiter = data.delimiter;

// If not an array, return undefined
if (!isArray(inputArray)) {
  return;
}

return inputArray
  .map(obj => obj[keyToConcatenate])
  .filter(obj => obj)
  .join(delimiter);


___NOTES___

Created on 22/05/2019, 10:54:06
