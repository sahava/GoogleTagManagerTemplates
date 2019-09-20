___INFO___

{
  "displayName": "User Distributor",
  "description": "Distribute users to groups based on a percentage split, and store this information in a cookie.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX1VzZXJEaXN0cmlidXRvci1TaW1vLUFoYXZh",
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
    "displayName": "Distribution type",
    "simpleValueType": true,
    "name": "splitType",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "Single (for e.g. sampling)",
        "value": "single"
      },
      {
        "displayValue": "Multi (for e.g. split testing)",
        "value": "multi"
      }
    ]
  },
  {
    "help": "When you add a number to the field, that is the probability of any user for whom the tag fires to be included in the group. This is indicated by having the string <strong>true</strong> as the value of the cookie. If the user is not included in the group, the cookie is not written.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "^(100|[1-9][0-9]|[1-9])$"
        ],
        "errorMessage": "The value must be a number between 1 and 100 (inclusive).",
        "type": "REGEX"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "splitType",
        "type": "EQUALS",
        "paramValue": "single"
      }
    ],
    "displayName": "Probability of being included",
    "simpleValueType": true,
    "name": "singlePercent",
    "valueUnit": "%",
    "type": "TEXT",
    "valueHint": "e.g. 10"
  },
  {
    "help": "Add each group you want to include in the distribution as its own row. Set the <strong>Group value</strong> field to the value of the cookie you want to set for users who are included in this group. Set the <strong>Distribution</strong> as the probability weight (out of 100) of being included in the group.\n<br/><br/>\nThe distribution probabilities should not exceed 100 when summed together. The sum can be less than 100 - in case a user doesn't have a group, the cookie is not set.",
    "enablingConditions": [
      {
        "paramName": "splitType",
        "type": "EQUALS",
        "paramValue": "multi"
      }
    ],
    "displayName": "Multiple groups",
    "name": "multiPercent",
    "simpleTableColumns": [
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "Group value",
        "name": "value",
        "isUnique": true,
        "type": "TEXT",
        "valueHint": "e.g. variation1"
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          },
          {
            "args": [
              "^(100|[1-9][0-9]|[1-9])$"
            ],
            "errorMessage": "The value must be a number between 1 and 100 (inclusive).",
            "type": "REGEX"
          }
        ],
        "defaultValue": "",
        "displayName": "Distribution",
        "name": "probability",
        "type": "TEXT",
        "valueHint": "e.g. 25"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "New group"
  },
  {
    "displayName": "Cookie settings",
    "name": "cookieSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "If you change this from the default, you <strong>must</strong> edit the Permissions of the tag template accordingly.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Cookie name",
        "defaultValue": "_gtm_group",
        "simpleValueType": true,
        "name": "cookieName",
        "type": "TEXT"
      },
      {
        "help": "Set to <strong>auto</strong> to write the cookie on the broadest domain name possible.",
        "displayName": "Cookie domain",
        "defaultValue": "auto",
        "simpleValueType": true,
        "name": "cookieDomain",
        "type": "TEXT"
      },
      {
        "displayName": "Cookie maximum age (in days)",
        "defaultValue": 365,
        "simpleValueType": true,
        "name": "cookieExpires",
        "valueUnit": "days",
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
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_gtm_group"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
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
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "_gtm_group"
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

const setCookie = require('setCookie');
const readCookie = require('getCookieValues');
const generateRandom = require('generateRandom');
const makeInteger = require('makeInteger');
const log = require('logToConsole');

// Percentage accumulation for multi
let acc = 0;

// Randomizer
const rand = generateRandom(1, 100);

// User data
const cookieName = data.cookieName;
const cookieDomain = data.cookieDomain;
const cookieMaxAge = data.cookieExpires * 24 * 60 * 60;
const single = data.singlePercent;
const multi = data.multiPercent;

// Only run if cookie is not set
if (readCookie(cookieName).length === 0) {

  // If single distribution
  if (single && rand <= single) {
    setCookie(
      cookieName,
      'true',
      {
        domain: cookieDomain,
        'max-age': cookieMaxAge
      }
    );
  }

  // If multi distribution
  if (multi) {
    multi.some(obj => {
      acc += makeInteger(obj.probability);
      if (rand <= acc) {
        setCookie(
          cookieName,
          obj.value,
          {
            domain: cookieDomain,
            'max-age': cookieMaxAge
          }
        );
        return true;
      }
    });
  }

}

data.gtmOnSuccess();


___NOTES___

Created on 18/09/2019, 13:50:03
