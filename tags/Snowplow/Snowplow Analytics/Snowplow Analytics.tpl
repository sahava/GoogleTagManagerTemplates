___INFO___

{
  "displayName": "Snowplow Analytics",
  "description": "Unofficial Snowplow Analytics template",
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
    "help": "This is the name of the tracker instance. It is used to distinguish the configuration you have set for one tracker instance from all the other possible tracker instances on the page.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Tracker Name",
    "simpleValueType": true,
    "name": "trackerName",
    "type": "TEXT",
    "valueHint": "e.g. spTracker"
  },
  {
    "help": "Enter the hostname of the collector.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "args": [
          "^[a-z0-9.:]+$"
        ],
        "errorMessage": "The endpoint URL must be a valid hostname.",
        "type": "REGEX"
      }
    ],
    "displayName": "Collector Endpoint",
    "simpleValueType": true,
    "name": "collectorEndpoint",
    "type": "TEXT",
    "valueHint": "e.g. snowplowcollector.cloudfront.net"
  },
  {
    "macrosInSelect": false,
    "selectItems": [
      {
        "displayValue": "Page View",
        "value": "trackPageView"
      },
      {
        "displayValue": "Structured Event",
        "value": "trackStructEvent"
      }
    ],
    "displayName": "Event Type",
    "simpleValueType": true,
    "name": "eventType",
    "type": "SELECT"
  },
  {
    "enablingConditions": [
      {
        "paramName": "eventType",
        "type": "EQUALS",
        "paramValue": "trackStructEvent"
      }
    ],
    "displayName": "Structured Event Parameters",
    "name": "structEventConfig",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Event Category",
        "simpleValueType": true,
        "name": "structEventCategory",
        "type": "TEXT"
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Event Action",
        "simpleValueType": true,
        "name": "structEventAction",
        "type": "TEXT"
      },
      {
        "displayName": "Event Label",
        "simpleValueType": true,
        "name": "structEventLabel",
        "type": "TEXT"
      },
      {
        "displayName": "Event Property",
        "simpleValueType": true,
        "name": "structEventProperty",
        "type": "TEXT"
      },
      {
        "valueValidators": [
          {
            "args": [
              "^[0-9]+(\\.[0-9]+)?$"
            ],
            "errorMessage": "Event Value must be a float, e.g. 13.5.",
            "type": "REGEX"
          }
        ],
        "displayName": "Event Value",
        "simpleValueType": true,
        "name": "structEventValue",
        "type": "TEXT"
      }
    ]
  },
  {
    "displayName": "Tracker Configuration Parameters",
    "name": "trackerConfiguration",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "notSetText": "Select a Snowplow Tracker Configuration Variable...",
        "help": "You must only select a variable of type <strong>Snowplow Tracker Configuration</strong> or the tag will not work. You can check the <em>Enable Overriding Configuration In This Tag</em> below to override individual fields of the variable with tag-specific configurations.",
        "macrosInSelect": true,
        "selectItems": [],
        "displayName": "Snowplow Tracker Configuration Variable",
        "simpleValueType": true,
        "name": "trackerConfigurationVariable",
        "type": "SELECT"
      },
      {
        "help": "Check this to enable individual Tracker Configuration Parameters set in the tag to override those established in the Snowplow Tracker Configuration Variable.",
        "defaultValue": false,
        "simpleValueType": true,
        "name": "enableOverriding",
        "checkboxText": "Enable Overriding Configuration In This Tag",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "enableOverriding",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "Tag-specific Parameters",
        "name": "overrideParamsGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "displayName": "You can add <a href=\"https://github.com/snowplow/snowplow/wiki/1-General-parameters-for-the-Javascript-tracker\">General Parameters</a> for the tracker here. You are encouraged to use the <strong>Snowplow Tracker Configuration Variable</strong> primarily, and only override select fields below.",
            "name": "overrideLabel",
            "type": "LABEL"
          },
          {
            "enablingConditions": [
              {
                "paramName": "enableOverriding",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "name": "trackerParamsOverride",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Parameter Name",
                "name": "name",
                "isUnique": true,
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Parameter Value",
                "name": "value",
                "type": "TEXT"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add Parameter"
          }
        ]
      },
      {
        "enablingConditions": [
          {
            "paramName": "enableOverriding",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "Contexts",
        "name": "contexts",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "webPage",
            "simpleValueType": true,
            "name": "webPage",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "performanceTiming",
            "simpleValueType": true,
            "name": "performanceTiming",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "gaCookies",
            "simpleValueType": true,
            "name": "gaCookies",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "geolocation",
            "simpleValueType": true,
            "name": "geolocation",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "augurIdentityLite",
            "simpleValueType": true,
            "name": "augurIdentityLite",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelyExperiments",
            "simpleValueType": true,
            "name": "optimizelyExperiments",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelyStates",
            "simpleValueType": true,
            "name": "optimizelyStates",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelyVariations",
            "simpleValueType": true,
            "name": "optimizelyVariations",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelyVisitor",
            "simpleValueType": true,
            "name": "optimizelyVisitor",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelyAudiences",
            "simpleValueType": true,
            "name": "optimizelyAudiences",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelyDimensions",
            "simpleValueType": true,
            "name": "optimizelyDimensions",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelySummary",
            "simpleValueType": true,
            "name": "optimizelySummary",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "optimizelyXSummary",
            "simpleValueType": true,
            "name": "optimizelyXSummary",
            "type": "SELECT"
          },
          {
            "notSetText": "[Inherit]",
            "selectItems": [
              {
                "displayValue": "True",
                "value": true
              },
              {
                "displayValue": "False",
                "value": false
              }
            ],
            "displayName": "parrable",
            "simpleValueType": true,
            "name": "parrable",
            "type": "SELECT"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Advanced Settings",
    "name": "advancedSettings",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "JavaScript Tracker",
        "name": "trackerGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "help": "This is the global namespace reserved for the Snowplow tracker.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "displayName": "Global Method Name",
            "defaultValue": "snowplow",
            "simpleValueType": true,
            "name": "globalName",
            "type": "TEXT"
          },
          {
            "defaultValue": true,
            "simpleValueType": true,
            "name": "useHosted",
            "checkboxText": "Use Snowplow-hosted library",
            "type": "CHECKBOX"
          },
          {
            "help": "See <a href=\"https://github.com/snowplow/snowplow-javascript-tracker/releases\">here</a> what the latest version of the tracker is.",
            "valueValidators": [
              {
                "args": [
                  "^[0-9.]+$"
                ],
                "errorMessage": "Must be a valid version number.",
                "type": "REGEX"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "useHosted",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "displayName": "JavaScript Tracker Version",
            "defaultValue": "2.10.2",
            "simpleValueType": true,
            "name": "libVersion",
            "type": "TEXT"
          },
          {
            "help": "Add the URL where your self-hosted Snowplow JavaScript library can be downloaded from. Remember to update <a href=\"https://www.simoahava.com/analytics/custom-templates-guide-for-google-tag-manager/#injects-scripts\"><strong>template permissions</strong></a> to allow script injection requests to this URL.",
            "enablingConditions": [
              {
                "paramName": "useHosted",
                "type": "EQUALS",
                "paramValue": false
              }
            ],
            "valueValidators": [
              {
                "args": [
                  "^https://"
                ],
                "type": "REGEX"
              }
            ],
            "displayName": "Self-hosted Library URL",
            "simpleValueType": true,
            "name": "selfHostedUrl",
            "type": "TEXT"
          }
        ]
      }
    ]
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
                    "string": "GlobalSnowplowNamespace"
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
                    "string": "snowplow"
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
                    "string": "snowplow.q"
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
                    "string": "_snowplow_trackers"
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
                    "string": "snowplow.q.push"
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
                "string": "https://d1fc8wv8zag5ca.cloudfront.net/*/sp.js"
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

const createQueue = require('createQueue');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const callInWindow = require('callInWindow');
const injectScript = require('injectScript');
const makeInteger = require('makeInteger');
const makeTableMap = require('makeTableMap');
const log = require('logToConsole');

// Access the generic settings
const globalName = data.globalName;
const libUrl = data.useHosted ? 'https://d1fc8wv8zag5ca.cloudfront.net/' + data.libVersion + '/sp.js' : data.selfHostedUrl;
const trackerName = data.trackerName;
const endpoint = data.collectorEndpoint;

// Creaete a list of initialized trackers
const trackerListGlobalName = '_snowplow_trackers';
const trackerList = createQueue(trackerListGlobalName);

// Build a map of the tracker parameter override table if present
const configMap = data.trackerParamsOverride && makeTableMap(data.trackerParamsOverride, 'name', 'value');

// Helper to fetch a property first from the tag, then from the tracker configuration variable
const getProp = prop => configMap[prop] || data[prop] || (data.trackerConfigurationVariable && data.trackerConfigurationVariable[prop]);

// Helper that returns a valid tracker configuration object
const getTrackerConfiguration = () => {
  if (!data.enableOverriding && (!data.trackerConfigurationVariable || data.trackerConfigurationVariable.type !== 'snowplow')) {
    return false;
  }
  
  return {
    appId: getProp('appId'),
    platform: getProp('platform'),
    respectDoNotTrack: getProp('respectDoNotTrack'),
    userFingerprint: getProp('userFingerprint'),
    userFingerprintSeed: getProp('userFingerprintSeed'),
    stateStorageStrategy: getProp('stateStorageStrategy'),
    cookieDomain: getProp('cookieDomain'),
    discoverRootDomain: getProp('discoverRootDomain'),
    cookieName: getProp('cookieName'),
    cookieLifetime: getProp('cookieLifetime') && makeInteger(getProp('cookieLifetime')),
    eventMethod: getProp('eventMethod'),
    encodeBase64: getProp('encodeBase64'),
    pageUnloadTimer: getProp('pageUnloadTimer') && makeInteger(getProp('pageUnloadTimer')),
    forceSecureTracker: getProp('forceSecureTracker'),
    forceUnsecureTracker: getProp('forceUnsecureTracker'),
    bufferSize: getProp('bufferSize') && makeInteger(getProp('bufferSize')),
    postPath: getProp('postPath'),
    maxPostBytes: getProp('maxPostBytes') && makeInteger(getProp('maxPostBytes')),
    contexts: {
      webPage: getProp('webPage'),
      performanceTiming: getProp('performanceTiming'),
      gaCookies: getProp('gaCookies'),
      geolocation: getProp('geolocation'),
      augurIdentityLite: getProp('augurIdentityLite'),
      optimizelyExperiments: getProp('optimizelyExperiments'),
      optimizelyStates: getProp('optimizelyStates'),
      optimizelyVariations: getProp('optimizelyVariations'),
      optimizelyVisitor: getProp('optimizelyVisitor'),
      optimizelyAudiences: getProp('optimizelyAudiences'),
      optimizelyDimensions: getProp('optimizelyDimensions'),
      optimizelySummary: getProp('optimizelySummary'),
      optimizelyXSummary: getProp('optimizelyXSummary'),
      parrable: getProp('parrable')
    }
  };
};

// Build the Snowplow global namespace and return the tracker
const getSp = () => {
  const snowplow = copyFromWindow(globalName);
  if (snowplow) {
    return snowplow;
  }

  const globalNamespace = createQueue('GlobalSnowplowNamespace');
  globalNamespace(globalName);
  // Can't use createArgumentsQueue here since the Snowplow tracker library
  // does not work with GTM's wrapper
  setInWindow(globalName, function() {
    callInWindow('snowplow.q.push', arguments);
  });
  createQueue('snowplow.q');
  return copyFromWindow(globalName);
};

const tracker = getSp();
const config = getTrackerConfiguration();

if (!config) {
  log('Snowplow: Could not create a proper tracker configuration object.');
  return data.gtmOnFailure();
}

// Only initialize the tracker if it hasn't been initialized yet
if (copyFromWindow(trackerListGlobalName).indexOf(trackerName) === -1) {
  tracker('newTracker', trackerName, endpoint, config);
  trackerList(trackerName);
}

// Send the event to Snowplow
tracker(
  data.eventType,
  data.structEventCategory,
  data.structEventAction,
  data.structEventLabel,
  data.structEventProperty,
  data.structEventValue
);

injectScript(libUrl, data.gtmOnSuccess, data.gtmOnFailure, 'splibrary');



___NOTES___

Created on 30/05/2019, 20:57:02
