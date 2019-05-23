___INFO___

{
  "displayName": "URL 2.0",
  "description": "More advanced version of the URL variable.",
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
    "macrosInSelect": false,
    "selectItems": [
      {
        "displayValue": "Build custom URL string",
        "value": "buildUrl"
      },
      {
        "displayValue": "Retrieve key from query string",
        "value": "queryKey"
      },
      {
        "displayValue": "Retrieve key from fragment",
        "value": "fragmentKey"
      }
    ],
    "displayName": "Variable type",
    "simpleValueType": true,
    "name": "variableType",
    "type": "SELECT"
  },
  {
    "enablingConditions": [
      {
        "paramName": "variableType",
        "type": "EQUALS",
        "paramValue": "buildUrl"
      }
    ],
    "displayName": "URL parts",
    "name": "urlParts",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "help": "e.g. http://, https://",
        "alwaysInSummary": true,
        "defaultValue": true,
        "simpleValueType": true,
        "name": "protocol",
        "checkboxText": "Protocol",
        "type": "CHECKBOX"
      },
      {
        "help": "e.g. sub.domain.com",
        "alwaysInSummary": true,
        "defaultValue": true,
        "simpleValueType": true,
        "name": "host",
        "checkboxText": "Hostname",
        "type": "CHECKBOX"
      },
      {
        "help": "e.g. :1313",
        "alwaysInSummary": true,
        "simpleValueType": true,
        "name": "port",
        "checkboxText": "Port",
        "type": "CHECKBOX"
      },
      {
        "help": "e.g. /download/file.html",
        "alwaysInSummary": true,
        "defaultValue": true,
        "simpleValueType": true,
        "name": "path",
        "checkboxText": "Path",
        "type": "CHECKBOX"
      },
      {
        "help": "e.g. .html",
        "alwaysInSummary": true,
        "simpleValueType": true,
        "name": "extension",
        "checkboxText": "Extension",
        "type": "CHECKBOX"
      },
      {
        "help": "e.g. ?client=true&id=abcd1234",
        "alwaysInSummary": true,
        "defaultValue": true,
        "simpleValueType": true,
        "name": "query",
        "checkboxText": "Query string",
        "type": "CHECKBOX"
      },
      {
        "help": "e.g. #scroll-to-top",
        "alwaysInSummary": true,
        "enablingConditions": [
          {
            "paramName": "urlSource",
            "type": "EQUALS",
            "paramValue": "pageUrl"
          }
        ],
        "simpleValueType": true,
        "name": "fragment",
        "checkboxText": "Fragment",
        "type": "CHECKBOX"
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "variableType",
        "type": "EQUALS",
        "paramValue": "queryKey"
      }
    ],
    "displayName": "Match type",
    "simpleValueType": true,
    "name": "queryKeyOptions",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "Retrieve first match",
        "value": "firstMatch"
      },
      {
        "displayValue": "Retrieve all matches",
        "value": "allMatches"
      }
    ]
  },
  {
    "help": "Fetch the value of this query key from the query string.",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "variableType",
        "type": "EQUALS",
        "paramValue": "queryKey"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Query key",
    "simpleValueType": true,
    "name": "queryKey",
    "type": "TEXT"
  },
  {
    "help": "If the fragment comprises key-value pairs, e.g. #name=john&phone=android, you can use this to fetch the value of a key from the fragment.",
    "enablingConditions": [
      {
        "paramName": "variableType",
        "type": "EQUALS",
        "paramValue": "fragmentKey"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Fragment key",
    "simpleValueType": true,
    "name": "fragmentKey",
    "type": "TEXT"
  },
  {
    "enablingConditions": [
      {
        "paramName": "variableType",
        "type": "NOT_EQUALS",
        "paramValue": "fragmentKey"
      }
    ],
    "displayName": "Advanced settings",
    "name": "advancedSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "Page URL",
            "value": "pageUrl"
          },
          {
            "displayValue": "Referrer URL",
            "value": "referrerUrl"
          }
        ],
        "displayName": "URL source",
        "defaultValue": "pageUrl",
        "simpleValueType": true,
        "name": "urlSource",
        "type": "SELECT",
        "subParams": []
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
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const callInWindow = require('callInWindow');
const getUrl = require('getUrl');
const getQueryParameters = require('getQueryParameters');
const getReferrerUrl = require('getReferrerUrl');
const getReferrerQueryParameters = require('getReferrerQueryParameters');
const query = require('queryPermission');
const log = require('logToConsole');

const variableType = data.variableType;
const source = data.urlSource;
const urlPermission = source === 'pageUrl' ? 'URL' : 'referrer';
const queryPermission = source === 'pageUrl' ? 'URL query' : 'referrer query';

// Helper methods
const isArray = arr => callInWindow('toString.call', arr) === '[object Array]';

// Check if template has sufficient permissions for the various URL parts
const checkPermissions = (type, part) => {
  if (type === 'URL') {
    return query('get_url', part) && getUrl(part);
  } else if (type === 'referrer') {
    return query('get_referrer', part) && getReferrerUrl(part);
  } else if (type === 'URL query') {
    return query('get_url', 'query', part);
  } else if (type === 'referrer query') {
    return query('get_referrer', 'query', part);
  }
};

const logError = (type, part) => {
  return log('Missing permission to access ' + type + ' ' + part);
};

if (variableType === 'buildUrl') {
  
  const types = ['protocol', 'host', 'port', 'path', 'extension', 'query', 'fragment'];
  let urlString = '';
  
  // Build the URL string based on user selection and available permissions
  types.forEach(type => {
    if (data[type]) {
      let str = checkPermissions(urlPermission, type);
      if (str === false) {
        return logError(urlPermission, type);
      }
      if (str.length) {
        if (type === 'protocol') str += '://';
        if (type === 'port') str = ':' + str;
        if (type === 'extension') str = '.' + str;
        if (type === 'query') str = '?' + str;
        if (type === 'fragment') str = '#' + str;
        urlString += str;
      }
    }
  });
  
  return urlString;
  
}

if (variableType === 'queryKey') {
  
  const option = data.queryKeyOptions;
  const queryKey = data.queryKey;
  const permission = checkPermissions(queryPermission, queryKey);
  
  if (permission === false) {
    return logError(queryPermission, 'key ' + queryKey);
  }
  
  // Fetch the given query key
  const queryValue = source === 'pageUrl' ? getQueryParameters(queryKey, option === 'allMatches') : getReferrerQueryParameters(queryKey, option === 'allMatches');
  
  // Return the key value or undefined if the key was not found in the URL
  return isArray(queryValue) && queryValue.length === 0 ? undefined : queryValue;
    
}

if (variableType === 'fragmentKey') {
  
  const fragmentString = checkPermissions('URL', 'fragment');
  const fragmentKey = data.fragmentKey;
  
  let fragmentValue;
  
  if (fragmentString === false) {
    return logError('URL', 'fragment');
  }
  
  const pairs = fragmentString.split('&');
  
  // Find the first matching "query" key in the fragment and return its value
  pairs.forEach(pair => {
    const parts = pair.split('=');
    if ((parts[0] === fragmentKey || parts[0] === '?' + fragmentKey) && fragmentValue === undefined) { 
      fragmentValue = parts[1];
    }
  });
  
  return fragmentValue;
  
}


___NOTES___

Created on 23/05/2019, 15:29:17
