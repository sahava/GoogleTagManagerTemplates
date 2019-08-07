___INFO___

{
  "displayName": "User Properties for App + Web",
  "description": "Variable template that returns a User Properties object you can use in a Google Analytics: App + Web configuration tag.",
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
    "displayName": "Use this template to return an object of key-value pairs, where each key is a <strong>User Property</strong> name you want to set in a <strong>Google Analytics: App + Web Configuration</strong> tag. <a href=\"https://www.simoahava.com/analytics/getting-started-with-google-analytics-app-web/#set-user-properties\">Read this</a> for more information.",
    "name": "label1",
    "type": "LABEL"
  },
  {
    "displayName": "&nbsp;",
    "name": "label2",
    "type": "LABEL"
  },
  {
    "alwaysInSummary": true,
    "name": "properties",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "User Property Name",
        "name": "name",
        "isUnique": true,
        "type": "TEXT",
        "valueHint": "e.g. user_type"
      },
      {
        "defaultValue": "",
        "displayName": "User Property Value",
        "name": "value",
        "type": "TEXT",
        "valueHint": "e.g. super_user"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Add User Property"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const props = data.properties;
return props ? require('makeTableMap')(props, 'name', 'value') : {};


___NOTES___

Created on 07/08/2019, 09:38:18
