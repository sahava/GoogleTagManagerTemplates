___INFO___

{
  "displayName": "Log Coveo Page View",
  "description": "Logs a Coveo Page View event in Coveo Cloud",
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
    "displayName": "Document Tagging",
    "name": "Document Tagging for Coveo",
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
        "help": "(Optional) The current language of the page's content. If not set, will use the language set on the document.",
        "displayName": "Language",
        "simpleValueType": true,
        "name": "language",
        "type": "TEXT"
      },
      {
        "help": "(Optional) Boolean representing whether the current visit is from an anonymous user.",
        "displayName": "Is Anonymous",
        "defaultValue": false,
        "simpleValueType": true,
        "name": "isAnonymous",
        "type": "TEXT"
      }
    ]
  },
  {
    "help": "Custom data to send alongside Page View events",
    "displayName": "Additional Custom Data",
    "name": "customData",
    "paramTableColumns": [
      {
        "param": {
          "displayName": "Key",
          "simpleValueType": true,
          "name": "key",
          "type": "TEXT"
        },
        "isUnique": true
      },
      {
        "param": {
          "displayName": "Value",
          "simpleValueType": true,
          "name": "value",
          "type": "TEXT"
        },
        "isUnique": false
      }
    ],
    "type": "PARAM_TABLE"
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

var log = require('logToConsole');
var callInWindow = require("callInWindow");
var getUrl = require("getUrl");
var getReferrerUrl = require("getReferrerUrl");
var readTitle = require("readTitle");

const customDataObject = (data.customData || []).reduce((all, row) => {
  all[row.key] = row.value;
  return all;
}, {});

const pageViewData = {
  location: data.location || getUrl(),
  referrer: data.referrer || getReferrerUrl(),
  language: data.language,
  title: data.title || readTitle(),
  contentIdKey: data.contentIdKey,
  contentIdValue: data.contentIdValue,
  anonymous: data.isAnonymous,
  customData: customDataObject
};

log('Coveo Analytics View Data =', pageViewData);

callInWindow("coveoua", "send", "view", pageViewData);

data.gtmOnSuccess();


___NOTES___

Created on 5/24/2019, 11:28:01 AM
