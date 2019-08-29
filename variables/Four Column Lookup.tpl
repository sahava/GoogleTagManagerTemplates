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
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeString = require('makeString');
const log = require('logToConsole');
const inputVar = makeString(data.inputVar);
const table = data.lookupTable;
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
var val = defaultValue !== undefined ? defaultValue.split('|') : undefined,
    obj = [],
    a,
    b;

if(typeof(table) !=='undefined'){
table.forEach(function(row){
  var arr = {};
  arr[row.inputVal]=[row.output1,row.output2,row.output3];
  obj.push(arr);
});
}
for(a=0;a<obj.length;a++){
if (typeof(obj[a][inputVar]) !== 'undefined'){
  var val = obj[a][inputVar];
  break;
} 
}

if (val !== undefined){
  //Convert variables
  for(a=0;a<val.length;a++){
    if(convertUndefined === true && val[a]== 'undefined'){
      val[a]=convertUndefinedTo;
      continue;
    }
    if(convertNull === true && val[a]=='null'){
      val[a]=convertNullTo;
      continue;
    }
    if(convertTrue === true && val[a]=='true'){
      val[a]=convertTrueTo;
      continue;
    }
    if(convertFalse === true && val[a]=='false'){
      val[a]=convertFalseTo;
      continue;
    }
    if(convertTrue === true && val[a]=='true'){
      val[a]=convertTrueTo;
      continue;
    }
  }

  //Convert case
  for(a=0;a<val.length;a++){
    if(convertCase === true){
      if(convertCaseTo=='lowercase'){
        val[a] = val[a].toLowerCase();
      } else{
        val[a] = val[a].toUpperCase();
      }
    }
  }
}
//Return the value
return val;


___NOTES___

Created on 14/08/2019, 15:10:35
