___INFO___

{
  "displayName": "Google Analytics Block Checker",
  "description": "Detects if Google Analytics is being blocks and pushed the details back to the dataLayer",
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
    "displayName": "Select when you want to send a notification to the dataLayer",
    "name": "title",
    "type": "LABEL"
  },
  {
    "displayName": "Events",
    "name": "group1",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "simpleValueType": true,
        "name": "eventGaBlocked",
        "checkboxText": "Google Analytics is being blocked",
        "type": "CHECKBOX"
      },
      {
        "help": "Insert the event name you want to push to the dataLayer is Google Analytics is being blocked.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "eventGaBlocked",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "dataLayer Push Event Name",
        "simpleValueType": true,
        "name": "eventGaBlockedName",
        "type": "TEXT"
      },
      {
        "simpleValueType": true,
        "name": "eventGaUnblocked",
        "checkboxText": "Google Analytics is not being blocked",
        "type": "CHECKBOX"
      },
      {
        "help": "Insert the event name you want to push to the dataLayer is Google Analytics is being blocked.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "eventGaUnblocked",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "dataLayer Push Event Name",
        "simpleValueType": true,
        "name": "eventGaUnblockedName",
        "type": "TEXT"
      }
    ]
  },
  {
    "macrosInSelect": false,
    "selectItems": [
      {
        "displayValue": "On Each Page Load",
        "value": "allPageLoads"
      },
      {
        "displayValue": "Once Per Session ( 30min )",
        "value": "oncePerSession"
      },
      {
        "displayValue": "Personalized",
        "value": "personalizedValue"
      }
    ],
    "displayName": "How often do you want to check if Google Analytics is being blocked",
    "defaultValue": "allPageLoads",
    "simpleValueType": true,
    "name": "notificationFrecuency",
    "type": "SELECT"
  },
  {
    "enablingConditions": [
      {
        "paramName": "notificationFrecuency",
        "type": "EQUALS",
        "paramValue": "personalizedValue"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "POSITIVE_NUMBER"
      }
    ],
    "displayName": "Once each (n) mins",
    "simpleValueType": true,
    "name": "cookieMaxAge",
    "type": "TEXT"
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
                    "string": "dataLayer"
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
                    "string": "dataLayer.push"
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
                "string": "__gabt"
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
        "publicId": "send_pixel",
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
                "string": "https://www.google-analytics.com/collect"
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
                    "string": "__gabt"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "/"
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
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// David Vallejo @thyng 
// 2019-07-12
const log = require('logToConsole');
const sendPixel = require('sendPixel');
const callInWindow = require('callInWindow');
const getCookieValues = require('getCookieValues');
const setCookie = require('setCookie');

data.cookieName = '__gabt';
data.cookieValue = getCookieValues(data.cookieName)[0];
data.url = 'https://www.google-analytics.com/collect';

// Sanity Checks
if (!data.cookieMaxAge) data.cookieMaxAge = 0;
if (data.notificationFrecuency === 'oncePerSession') data.cookieMaxAge = 30 * 60;
if (data.notificationFrecuency === 'personalizedValue') data.cookieMaxAge = data.cookieMaxAge * 60;

log("data", data);
if (data.cookieValue) {
    callInWindow('dataLayer.push', {
        'event': data.cookieValue === 0 ? data.eventGaUnblockedName : data.eventGaBlockedName
    });
} else {
    if (data.eventGaBlocked || data.eventGaUnblocked) {
        const onFailure = function() {
            if (!data.eventGaBlocked) return;
            if (data.cookieMaxAge !== 0)
                setCookie(data.cookieName, '1', {
                    domain: 'auto',
                    path: '/',
                    'max-age': data.cookieMaxAge !== 0 ? data.cookieMaxAge : undefined
                });
            callInWindow('dataLayer.push', {
                'event': data.eventGaBlockedName
            });
        };
        const onSuccess = function() {
            if (!data.eventGaUnblocked) return;

            if (data.cookieMaxAge !== 0)
                setCookie(data.cookieName, '0', {
                    domain: 'auto',
                    path: '/',
                    'max-age': data.cookieMaxAge !== 0 ? data.cookieMaxAge : undefined
                });
            callInWindow('dataLayer.push', {
                'event': data.eventGaUnblockedName
            });
        };
        sendPixel(data.url, onSuccess, onFailure);
    }
}

data.gtmOnSuccess();


___NOTES___

Created on 12/7/2019 0:59:22