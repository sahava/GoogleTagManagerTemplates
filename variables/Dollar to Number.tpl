___INFO___

{
  "displayName": "Dollar to Number",
  "description": "Converts a string formatted as dollars to a number (e.g. \"$1,0000.00\" -> 1000.00).",
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
    "help": "Enter the dollar string like \"$1.00\" or \"$1\"",
    "valueValidators": [
      {
        "args": [
          "\\$[\\d,\\,]+(\\.\\d+)?"
        ],
        "type": "REGEX"
      }
    ],
    "displayName": "String to Convert",
    "simpleValueType": true,
    "name": "dollarString",
    "type": "TEXT"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

let dollarString = data.dollarString;
dollarString = dollarString.replace("$","");
dollarString = dollarString.replace(",","");

// Variables must return a value.
return dollarString;


___NOTES___

Created on 8/19/2019, 11:19:59 AM
