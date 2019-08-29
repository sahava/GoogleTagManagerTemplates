___INFO___

{
  "displayName": "Four Column Regex",
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
    "name": "regexTable",
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
    "displayName": "Advanced Settings",
    "name": "advanced",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "defaultValue": true,
        "simpleValueType": true,
        "name": "ignoreCase",
        "checkboxText": "Ignore Case",
        "type": "CHECKBOX"
      },
      {
        "help": "If enabled, patterns must match entire input. This is equivalent to having start (^) and end ($) anchors implicitly around your pattern. If disabled, patterns will match when they are found anywhere in the input.",
        "defaultValue": true,
        "simpleValueType": true,
        "name": "fullMatch",
        "checkboxText": "Full Match Only",
        "type": "CHECKBOX"
      },
      {
        "help": "If enabled, you can use dollar-sign replacement syntax to include portions of the input (e.g. from capturing groups in the matched pattern) within the output. If you are using this in conjunction with 'Ignore Case' the returned value will be in lowercase.",
        "defaultValue": true,
        "simpleValueType": true,
        "name": "captureReplace",
        "checkboxText": "Enable Capture Groups Functionality",
        "type": "CHECKBOX"
      }
    ]
  },
  {
    "help": "Select options below to format the value that will be output by this variable. This will format each value in the array, the default tab will try and format the array itself.",
    "displayName": "Format Values",
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
const table = data.regexTable || [];
const defaultValue = data.defaultValue;
//Advanced Settings Values
const ignoreCase = data.ignoreCase;
const fullMatch = data.fullMatch;
const capRep = data.captureReplace;
//Format Value Values
const convertCaseTo = data.convertCaseTo;
const convertNull = data.convertNull;
const convertNullTo = data.convertNullTo;
const convertUndefined = data.convertUndefined;
const convertUndefinedTo = data.convertUndefinedTo;
const convertTrue = data.convertTrue;
const convertTrueTo = data.convertTrueTo;
const convertFalse = data.convertFalse;
const convertFalseTo = data.convertFalseTo;
//If you need to change your default delimter, do it here.
const delimiter = '|';
const input = ignoreCase ? inputVar.toLowerCase() : inputVar;

return table.filter(row => {
  const re = ignoreCase ? row.inputVal.toLowerCase() : row.inputVal;
  return input.match(re) ? (fullMatch ? input.match(re)[0]===input : input.match(re)) : undefined;
}).map(matchedRow => {
  const re = matchedRow.inputVal;
  return [matchedRow.output1, matchedRow.output2, matchedRow.output3].map(output=>{
    return capRep ? (output.match('^\\$\\d+') ? input.match(re)[output.match('\\d+')[0]] : output) : output;
  }).map(output => {
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
