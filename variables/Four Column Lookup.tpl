___INFO___

{
  "displayName": "Four Column Lookup",
  "description": "A Four Column Regex Table",
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
    "displayName": "Input Variable",
    "simpleValueType": true,
    "name": "inputVar",
    "type": "TEXT"
  },
  {
    "alwaysInSummary": true,
    "displayName": "Lookup Table",
    "name": "lookupTable",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Input",
        "name": "inputVal",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Output 1",
        "name": "output1",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Output 2",
        "name": "output2",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Output 3",
        "name": "output3",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE"
  },
  {
    "simpleValueType": true,
    "name": "defaultChecked",
    "checkboxText": "Set Default Value",
    "type": "CHECKBOX"
  },
  {
    "help": "To return an array as the default value, provide outputs as pipe separated strings. If you need the pipe in your output, you'll need to change the template.",
    "enablingConditions": [
      {
        "paramName": "defaultChecked",
        "type": "EQUALS",
        "paramValue": true
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Default Value",
    "simpleValueType": true,
    "name": "defaultValue",
    "type": "TEXT"
  },
  {
    "help": "Select options below to format the value that will be output by this variable. This will format each value in the array, the default tab will try and format the array itself.",
    "displayName": "Format Value",
    "name": "format",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "simpleValueType": true,
        "name": "convertCase",
        "checkboxText": "Convert Case to…",
        "type": "CHECKBOX"
      },
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "Lowercase",
            "value": "lowercase"
          },
          {
            "displayValue": "Uppercase",
            "value": "uppercase"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "convertCase",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertCaseTo",
        "type": "SELECT"
      },
      {
        "simpleValueType": true,
        "name": "convertNull",
        "checkboxText": "Convert null to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertNull",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertNullTo",
        "type": "TEXT"
      },
      {
        "simpleValueType": true,
        "name": "convertUndefined",
        "checkboxText": "Convert undefined to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertUndefined",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertUndefinedTo",
        "type": "TEXT"
      },
      {
        "simpleValueType": true,
        "name": "convertTrue",
        "checkboxText": "Convert true to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertTrue",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertTrueTo",
        "type": "TEXT"
      },
      {
        "simpleValueType": true,
        "name": "convertFalse",
        "checkboxText": "Convert false to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertFalse",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertFalseTo",
        "type": "TEXT"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeString = require('makeString');
const inputVar = makeString(data.inputVar);
const table = data.lookupTable || [];
const defaultValue = data.defaultValue;
//Format Value Values
const convertCaseTo = data.convertCaseTo;
const convertCase = data.convertCase;
const convertNullTo = data.convertNullTo;
const convertNull = data.convertNull;
const convertUndefinedTo = data.convertUndefinedTo;
const convertUndefined = data.convertUndefined;
const convertTrueTo = data.convertTrueTo;
const convertTrue = data.convertTrue;
const convertFalseTo = data.convertFalseTo;
const convertFalse = data.convertFalse;
//Declare Variables
//If you need to change your default delimter, do it here.
const delimiter = '|';

return table.filter(row => {
  return row.inputVal === inputVar;
}).map(matchedRow => {
  return [matchedRow.output1, matchedRow.output2, matchedRow.output3].map(output => {
    if (convertUndefined && output === undefined) {
      return convertUndefinedTo;
    }
    if (convertNull && output === null) {
      return convertNullTo;
    }
    if (convertTrue && output === true) {
      return convertTrueTo;
    }
    if (convertFalse && output === false) {
      return convertFalseTo;
    }
    return output;
  }).map(output => {
    if (convertCaseTo === 'lowercase') {
      return output.toLowerCase();
    }
    if (convertCaseTo === 'uppercase') {
      return output.toUpperCase();
    }
    return output;
  });
}).shift() || (defaultValue ? defaultValue.split(delimiter) : undefined);


___NOTES___

Created on 14/08/2019, 15:10:35
