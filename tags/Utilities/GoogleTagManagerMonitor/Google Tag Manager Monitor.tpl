___INFO___

{
  "displayName": "Google Tag Manager Monitor",
  "description": "A template for setting up tag monitoring in Google Tag Manager.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0dvb2dsZS1UYWctTWFuYWdlci1Nb25pdG9yLVNpbW8tQWhhdmE=",
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
    "help": "Provide the URL to which the GET request with tag data is sent.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "args": [
          "^https://.+"
        ],
        "errorMessage": "The endpoint must be a valid URL",
        "type": "REGEX"
      }
    ],
    "displayName": "GET request endpoint",
    "simpleValueType": true,
    "name": "endPoint",
    "type": "TEXT",
    "valueHint": "e.g. https://track.com/collect"
  },
  {
    "help": "If you select <strong>No</strong>, details of all the tags that fired for any given hit are sent in a single GET request. If you select <strong>Yes</strong>, you can choose the maximum number of tags per request, and the tag will automatically send multiple requests if necessary.",
    "displayName": "Batch hits",
    "simpleValueType": true,
    "name": "batchHits",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "No",
        "value": "no"
      },
      {
        "displayValue": "Yes",
        "help": "",
        "value": "yes",
        "subParams": [
          {
            "help": "Enter the maximum number of tags per request that will be dispatched to the endpoint. If necessary, multiple requests will be made.",
            "valueValidators": [
              {
                "type": "POSITIVE_NUMBER"
              }
            ],
            "displayName": "Maximum number of tags per request",
            "defaultValue": 10,
            "simpleValueType": true,
            "name": "maxTags",
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
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
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
                "string": "https://placeholder.com/collect*"
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
        "publicId": "read_event_metadata",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require the necessary APIs
const addEventCallback = require('addEventCallback');
const readFromDataLayer = require('copyFromDataLayer');
const sendPixel = require('sendPixel');
const getTimestamp = require('getTimestamp');

// Get the dataLayer event that triggered the tag
const event = readFromDataLayer('event');

// Add a timestamp to separate events named the same way from each other
const eventTimestamp = getTimestamp();

const endPoint = data.endPoint;
const batchHits = data.batchHits === 'yes';
const maxTags = data.maxTags;

// Utility for splitting an array into multiple arrays of given size
const splitToBatches = (arr, size) => {
  const newArr = [];
  for (let i = 0, len = arr.length; i < len; i += size) {
    newArr.push(arr.slice(i, i + size));
  }
  return newArr;
};

// The addEventCallback gets two arguments: container ID and a data object with an array of tags that fired
addEventCallback((ctid, eventData) => {

  // Filter out the monitoring tag itself
  const tags = eventData.tags.filter(t => t.exclude !== 'true');
  
  // If batching is enabled, split the tags into batches of the given size
  const batches = batchHits ? splitToBatches(tags, maxTags) : [tags];
  
  // For each batch, build a payload and dispatch to the endpoint as a GET request
  batches.forEach(tags => {
    let payload = '?eventName=' + event + '&eventTimestamp=' + eventTimestamp;
    tags.forEach((tag, idx) => {
      const tagPrefix = '&tag' + (idx + 1);
      payload +=
        tagPrefix + 'id=' + tag.id +
        tagPrefix + 'nm=' + tag.name +
        tagPrefix + 'st=' + tag.status +
        tagPrefix + 'et=' + tag.executionTime;
    });
    sendPixel(endPoint + payload, null, null);
  });
});

// After adding the callback, signal tag completion
data.gtmOnSuccess();


___NOTES___

Created on 11/07/2019, 09:11:59
