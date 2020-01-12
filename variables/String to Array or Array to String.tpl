___INFO___

{
  "displayName": "String to Array or Array to String",
  "author": "Kevin McLaughlin",
  "description": "Create an array for the given string a delimiter OR create a string from the given array of primitives",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "This variable can either convert a given string to an array OR \nconvert a given array of primitives to a string.",
    "name": "helpText",
    "type": "LABEL"
  },
  {
    "displayName": "",
    "simpleValueType": true,
    "name": "conversionSelection",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "String to Array",
        "help": "Convert the given string to an array (e.g. \"123,456,789\" -\u003e [123,456,789])",
        "value": "stringToArray"
      },
      {
        "displayValue": "Array to String",
        "help": "Convert the given array of primitives to a string (e.g. [1,2,3] -\u003e \"1,2,3\")",
        "value": "arrayToString"
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "conversionSelection",
        "type": "EQUALS",
        "paramValue": "stringToArray"
      }
    ],
    "displayName": "Input string",
    "simpleValueType": true,
    "name": "inputString",
    "type": "TEXT"
  },
  {
    "help": "If checked, will convert the string to a number (e.g. \"1,2,3\" into [1,2,3]). NOTE will convert all non-numbers to zero.",
    "enablingConditions": [
      {
        "paramName": "conversionSelection",
        "type": "EQUALS",
        "paramValue": "stringToArray"
      }
    ],
    "simpleValueType": true,
    "name": "convertToNumber",
    "checkboxText": "Convert to Int?",
    "type": "CHECKBOX"
  },
  {
    "macrosInSelect": true,
    "selectItems": [],
    "enablingConditions": [
      {
        "paramName": "conversionSelection",
        "type": "EQUALS",
        "paramValue": "arrayToString"
      }
    ],
    "valueValidators": [
      {
        "args": [
          1
        ],
        "type": "TABLE_ROW_COUNT"
      }
    ],
    "displayName": "Input Array",
    "simpleValueType": true,
    "name": "inputArray",
    "type": "SELECT"
  },
  {
    "help": "Choose a delimiter symbol or string used to separate each value in the string.",
    "alwaysInSummary": true,
    "displayName": "Delimiter",
    "defaultValue": ",",
    "simpleValueType": true,
    "name": "delimiter",
    "type": "TEXT"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeInteger = require("makeInteger");
const getType = require("getType");
const conversionSelection = data.conversionSelection;
const delimiter = data.delimiter;

switch (conversionSelection) {
  case "stringToArray":
    const inputString = data.inputString;
    const array = inputString.split(delimiter);
    if (data.convertToNumber) {
      return array.map(obj => makeInteger(obj));
    } else {
      return array;
    }
    break;
  case "arrayToString":
    
    const inputArray = data.inputArray;
    if (getType(inputArray) === "array"){
    	return inputArray.join(delimiter);
    }
    else{
      	return undefined;
    }
    break;
}


___TESTS___

scenarios: []


___NOTES___

Created on 30/05/2019, 09:00:00


