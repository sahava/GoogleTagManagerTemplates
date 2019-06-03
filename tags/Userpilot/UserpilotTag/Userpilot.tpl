___INFO___

{
  "displayName": "Userpilot",
  "description": "Unofficial tag template for Userpilot.",
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
    "help": "Add the App Token from your <a href=\"https://app.userpilot.io/settings/setup\">settings</a> here. The App Token is <strong>abcdefg</strong> in https://deploy.userpilot.io/<strong>abcdefg</strong>.js.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "App Token",
    "simpleValueType": true,
    "name": "appToken",
    "type": "TEXT"
  },
  {
    "macrosInSelect": false,
    "selectItems": [
      {
        "displayValue": "Identify User",
        "value": "identify"
      },
      {
        "displayValue": "Reload Userpilot",
        "value": "reload"
      },
      {
        "displayValue": "Track Event",
        "value": "trackEvent"
      },
      {
        "displayValue": "Trigger",
        "value": "trigger"
      }
    ],
    "displayName": "Tag Type",
    "simpleValueType": true,
    "name": "trackType",
    "type": "SELECT"
  },
  {
    "enablingConditions": [
      {
        "paramName": "trackType",
        "type": "EQUALS",
        "paramValue": "identify"
      }
    ],
    "name": "userInfo",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "enablingConditions": [
          {
            "paramName": "anonymous",
            "type": "EQUALS",
            "paramValue": false
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Unique User ID",
        "simpleValueType": true,
        "name": "userId",
        "type": "TEXT"
      },
      {
        "defaultValue": false,
        "simpleValueType": true,
        "name": "anonymous",
        "checkboxText": "Anonymous",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "anonymous",
            "type": "EQUALS",
            "paramValue": false
          }
        ],
        "displayName": "User Properties",
        "name": "userAttributesGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "displayName": "Add user attributes for the identified user. See <a href=\"https://docs.userpilot.com/article/23-identify-users-track-custom-events\">here</a> for more information.",
            "name": "userAttributesHelp",
            "type": "LABEL"
          },
          {
            "displayName": "",
            "name": "userAttributes",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "defaultValue": "",
                "displayName": "Attribute name",
                "name": "name",
                "isUnique": true,
                "type": "TEXT",
                "valueHint": "e.g. name"
              },
              {
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "defaultValue": "",
                "displayName": "Attribute value",
                "name": "value",
                "type": "TEXT",
                "valueHint": "e.g. John Doe"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add attriburte"
          }
        ]
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "trackType",
        "type": "EQUALS",
        "paramValue": "trackEvent"
      }
    ],
    "name": "eventInfo",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Custom Event Name",
        "simpleValueType": true,
        "name": "customEventName",
        "type": "TEXT",
        "valueHint": "e.g. logout"
      },
      {
        "displayName": "Event Metadata",
        "name": "customEventMetadataGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "displayName": "Add optional metadata to event call in the form of property name-value pairs.",
            "name": "customEventMetadataHelp",
            "type": "LABEL"
          },
          {
            "displayName": "",
            "name": "customEventMetadata",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "defaultValue": "",
                "displayName": "Property name",
                "name": "name",
                "isUnique": false,
                "type": "TEXT",
                "valueHint": "e.g. customerType"
              },
              {
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "defaultValue": "",
                "displayName": "Property value",
                "name": "value",
                "type": "TEXT",
                "valueHint": ""
              }
            ],
            "type": "SIMPLE_TABLE"
          }
        ]
      }
    ]
  },
  {
    "help": "Force a Userpilot content with given ID to show for the current user. This overrides any targeting conditions set for the content.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "trackType",
        "type": "EQUALS",
        "paramValue": "trigger"
      }
    ],
    "displayName": "Content ID",
    "simpleValueType": true,
    "name": "triggerContentId",
    "type": "TEXT"
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
                "string": "https://deploy.userpilot.io/*.js"
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
                    "string": "userpilot"
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
                    "string": "userpilot.identify"
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
                    "string": "userpilot.reload"
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
                    "string": "userpilot.trigger"
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
                    "string": "userpilot.track"
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

const makeTableMap = require('makeTableMap');
const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const copyFromWindow = require('copyFromWindow');
const log = require('logToConsole');

const setInWindow = require('setInWindow');

const endpoint = 'https://deploy.userpilot.io/' + data.appToken + '.js';

const exec = () => {
  let command, arg, props;
  
  if (data.trackType === 'identify') {
    if (!data.anonymous) {
      command = 'identify';
      arg = data.userId;
      props = data.userAttributes ? makeTableMap(data.userAttributes, 'name', 'value') : {};
    } else {
      command = 'anonymous';
    }
  }
  
  if (data.trackType === 'reload') {
    command = 'reload';
  }
  
  if (data.trackType === 'trackEvent') {
    command = 'track';
    arg = data.customEventName;
    props = data.customEventMetadata ? makeTableMap(data.customEventMetadata, 'name', 'value') : {};
  }
  
  if (data.trackType === 'trigger') {
    command = 'trigger';
    arg = data.triggerContentId;
  }
  
  if (copyFromWindow('userpilot') && command) {
    callInWindow('userpilot.' + command, arg, props);
    data.gtmOnSuccess();
  } else {
    data.gtmOnFailure();
  }
};

injectScript(endpoint, exec, data.gtmOnFailure, 'userpilot');


___NOTES___

Created on 03/06/2019, 13:58:33
