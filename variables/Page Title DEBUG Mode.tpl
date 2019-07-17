___INFO___

{
  "displayName": "Page Title DEBUG Mode",
  "description": "When in DEBUG mode, add the given string to the page title. When not in DEBUG mode, return the regular title. Useful for filtering out internal traffic when in DEBUG mode",
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
    "help": "Enter the string you want to add to the title",
    "displayName": "String to Add",
    "simpleValueType": true,
    "name": "stringToAdd",
    "type": "TEXT"
  },
  {
    "help": "Select the variable you use for DEBUG mode",
    "macrosInSelect": true,
    "selectItems": [],
    "displayName": "Debug Mode",
    "simpleValueType": true,
    "name": "debugMode",
    "type": "SELECT"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_title",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var readTitle = require('readTitle');
const stringToAdd = data.stringToAdd;
const debugMode = data.debugMode;

if (debugMode){
	return readTitle() + stringToAdd;
}
return readTitle();


___NOTES___

Created on 7/15/2019, 12:39:40 PM
