___INFO___

{
  "displayName": "Currency Conversion",
  "description": "Use this with a Custom HTML tag that fetches exchange rates from exchangeratesapi.io.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0N1cnJlbmN5LUNvbnZlcnNpb24tU2ltby1BaGF2YQ==",
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
    "type": "LABEL",
    "name": "info",
    "displayName": "See <a href=\"https://bit.ly/2Yxuv7G\">this article</a> for more information on how to set up the currency exchange fetch."
  },
  {
    "alwaysInSummary": true,
    "displayName": "Source value",
    "simpleValueType": true,
    "name": "sourceValue",
    "type": "TEXT"
  },
  {
    "alwaysInSummary": true,
    "selectItems": [
      {
        "displayValue": "AUD",
        "value": "AUD"
      },
      {
        "displayValue": "BGN",
        "value": "BGN"
      },
      {
        "displayValue": "BRL",
        "value": "BRL"
      },
      {
        "displayValue": "CAD",
        "value": "CAD"
      },
      {
        "displayValue": "CHF",
        "value": "CHF"
      },
      {
        "displayValue": "CNY",
        "value": "CNY"
      },
      {
        "displayValue": "CZK",
        "value": "CZK"
      },
      {
        "displayValue": "DKK",
        "value": "DKK"
      },
      {
        "displayValue": "GBP",
        "value": "GBP"
      },
      {
        "displayValue": "HKD",
        "value": "HKD"
      },
      {
        "displayValue": "HRK",
        "value": "HRK"
      },
      {
        "displayValue": "HUF",
        "value": "HUF"
      },
      {
        "displayValue": "IDR",
        "value": "IDR"
      },
      {
        "displayValue": "ILS",
        "value": "ILS"
      },
      {
        "displayValue": "INR",
        "value": "INR"
      },
      {
        "displayValue": "ISK",
        "value": "ISK"
      },
      {
        "displayValue": "JPY",
        "value": "JPY"
      },
      {
        "displayValue": "KRW",
        "value": "KRW"
      },
      {
        "displayValue": "MXN",
        "value": "MXN"
      },
      {
        "displayValue": "MYR",
        "value": "MYR"
      },
      {
        "displayValue": "NOK",
        "value": "NOK"
      },
      {
        "displayValue": "NZD",
        "value": "NZD"
      },
      {
        "displayValue": "PHP",
        "value": "PHP"
      },
      {
        "displayValue": "PLN",
        "value": "PLN"
      },
      {
        "displayValue": "RON",
        "value": "RON"
      },
      {
        "displayValue": "RUB",
        "value": "RUB"
      },
      {
        "displayValue": "SEK",
        "value": "SEK"
      },
      {
        "displayValue": "SGD",
        "value": "SGD"
      },
      {
        "displayValue": "THB",
        "value": "THB"
      },
      {
        "displayValue": "TRY",
        "value": "TRY"
      },
      {
        "displayValue": "USD",
        "value": "USD"
      },
      {
        "displayValue": "ZAR",
        "value": "ZAR"
      }
    ],
    "displayName": "Currency of the source value",
    "defaultValue": "USD",
    "simpleValueType": true,
    "name": "convertFrom",
    "type": "SELECT"
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
                "string": "rates"
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

const copyFromDataLayer = require('copyFromDataLayer');
const makeString = require('makeString');
const log = require('logToConsole');

const _isNaN = x => makeString(x) === 'NaN';

const rates = copyFromDataLayer('rates');
const source = data.sourceValue;
const convertFrom = data.convertFrom;

if (!rates || !rates[convertFrom] || _isNaN(source * 1)) {
  return source;
}

return source / rates[convertFrom];


___NOTES___

Created on 07/08/2019, 13:48:06
