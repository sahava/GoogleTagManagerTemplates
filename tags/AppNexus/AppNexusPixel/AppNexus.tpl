___INFO___

{
  "displayName": "AppNexus",
  "description": "Unofficial template for creating Conversion and Segment Pixels in for AppNexus.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0FwcE5leHVzLVNpbW8tQWhhdmE=",
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
    "displayName": "Pixel Type",
    "simpleValueType": true,
    "name": "pixelType",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "Conversion",
        "value": "conversion",
        "subParams": []
      },
      {
        "displayValue": "Segment",
        "value": "segment"
      }
    ]
  },
  {
    "displayName": "Pixel ID",
    "simpleValueType": true,
    "name": "pixelId",
    "type": "TEXT"
  }
]


___WEB_PERMISSIONS___

[
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
                "string": "https://ib.adnxs.com/"
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

const sendPixel = require('sendPixel');

const pixelType = data.pixelType;
const baseUrl = 'https://ib.adnxs.com/' +
      (data.pixelType === 'conversion' ? 'px?t=2&id=' : 'seg?add=');

sendPixel(baseUrl + data.pixelId, data.gtmOnSuccess, data.gtmOnFailure);


___NOTES___

Created on 05/07/2019, 10:21:41
