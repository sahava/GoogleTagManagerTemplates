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
const table = data.regexTable;
const defaultValue = data.defaultValue;
//Advanced Settings Values
const ignoreCase = data.ignoreCase;
const fullMatch = data.fullMatch;
const capRep = data.captureReplace;
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
var val = defaultValue !== undefined ? defaultValue.split('|') : defaultValue,
    a,
    b;
if(typeof(table) !=='undefined'){
  //Itterate through the table
  for(a=0;a<table.length;a++){
    if(ignoreCase===true){
      //Convert regex and input to lowercase
      var input = inputVar.toLowerCase(),
          re = table[a].inputVal.toLowerCase();
    } else{
      var input = inputVar,
          re = table[a].inputVal;
    }
    if(input.match(re) !== null){
      if (fullMatch===true){
        if(input.match(re)[0]==input){
          val=[table[a].output1,table[a].output2,table[a].output3];
          if (capRep === true){
            val = [table[a].output1,table[a].output2,table[a].output3];
            for(b=0;b<val.length;b++){
              if(val[b].match('\\$\\d+') !== null){
                val[b] = input.match(re)[val[b].match('\\d+')[0]];
              }
            }
          }
          break;
        } else {
          continue;
        }
      } else {
        val = [table[a].output1,table[a].output2,table[a].output3];
        if (capRep === true){
          for(a=b;b<val.length;b++){
            if(val[b].match('\\$\\d+') !== null){
              val[b] = input.match(re)[val[b].match('\\d+')[0]];
            }
          }
        }
        break;
      }
    }
  }
}

if (val !== undefined){
  //Convert variables
  for(a=0;a<val.length;a++){
    if(convertUndefined === true && val[a]=='undefined'){
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
      } else {
        val[a] = val[a].toUpperCase();
      }
    }
  }
}
//Return the value
return val;


___NOTES___

Created on 14/08/2019, 15:10:35
