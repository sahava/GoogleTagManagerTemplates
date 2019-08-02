___INFO___

{
  "displayName": "Adtraction",
  "description": "Template for adding the Adtraction affiliate script to the page.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0FkdHJhY3Rpb24tU2ltby1BaGF2YQ==",
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
    "help": "Enter the value that comes after <strong>?ap=</strong> in you Adtraction script tag's <strong>src</strong>. For example, if the script src is <em>https://adtr.io/jsTag?ap=12345</em>, you would enter <strong>12345</strong> in this field.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "POSITIVE_NUMBER"
      },
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Advert Program ID (ap)",
    "simpleValueType": true,
    "name": "ap",
    "type": "TEXT",
    "valueHint": "e.g. 1234567890"
  },
  {
    "displayName": "Tag Type",
    "simpleValueType": true,
    "name": "tagType",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "Initialization only",
        "value": "init"
      },
      {
        "displayValue": "Initialization (if necessary) + event",
        "value": "event"
      }
    ]
  },
  {
    "help": "Add the parameters as individual rows, using the instructions provided by Adtraction.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "type": "EQUALS",
        "paramValue": "event"
      }
    ],
    "displayName": "Tag Parameters",
    "name": "tagParams",
    "simpleTableColumns": [
      {
        "selectItems": [
          {
            "displayValue": "t",
            "value": "t"
          },
          {
            "displayValue": "c",
            "value": "c"
          },
          {
            "displayValue": "tp",
            "value": "tp"
          },
          {
            "displayValue": "ti",
            "value": "ti"
          },
          {
            "displayValue": "am",
            "value": "am"
          },
          {
            "displayValue": "cpn",
            "value": "cpn"
          },
          {
            "displayValue": "xd",
            "value": "xd"
          }
        ],
        "defaultValue": "",
        "displayName": "Parameter",
        "name": "name",
        "isUnique": true,
        "type": "SELECT"
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


___WEB_PERMISSIONS___

[
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
                "string": "https://adtr.io/jsTag?ap*"
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
                    "string": "ADT"
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
                    "string": "ADT.Tag.doEvent"
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

const injectScript = require('injectScript');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const callInWindow = require('callInWindow');
const makeTableMap = require('makeTableMap');
const log = require('logToConsole');

const baseUrl = 'https://adtr.io/jsTag?ap=' + data.ap;

const sendEvent = () => {
  const ADT = copyFromWindow('ADT') || {};
  if (!ADT.Tag) {
    ADT.Tag = {};
  }
  const params = data.tagParams ? makeTableMap(data.tagParams, 'name', 'value') : {};
  for (let p in params) {
    ADT.Tag[p] = params[p];
  }
  log(ADT.Tag);
  setInWindow('ADT', ADT, true);
  callInWindow('ADT.Tag.doEvent');
};

const onSuccess = () => {
  if (data.tagType === 'event') {
    sendEvent();
  }
  data.gtmOnSuccess();
};

injectScript(baseUrl, onSuccess, data.gtmOnFailure, 'adtr');


___NOTES___

Created on 02/08/2019, 11:08:39
