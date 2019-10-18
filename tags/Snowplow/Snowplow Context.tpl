___INFO___

{
  "displayName": "Snowplow Context",
  "description": "Creates a Snowplow Analytics context for custom events or data",
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
    "displayName": "Schema Information",
    "name": "schemaInfo",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "help": "The iglu namespace of the custom schema (e.g. 'com.company.events')",
        "displayName": "Schema Name Space",
        "simpleValueType": true,
        "name": "schemaNameSpace",
        "type": "TEXT",
        "valueHint": "com.company.events"
      },
      {
        "help": "The name of the custom schema (e.g. 'user_action')",
        "displayName": "Schema Name",
        "simpleValueType": true,
        "name": "schemaName",
        "type": "TEXT",
        "valueHint": "user_action"
      },
      {
        "help": "The semver version of the custom schema in the format MAJOR-MINOR-REVISION (e.g. '1-1-1')",
        "displayName": "Schema Version",
        "defaultValue": "1-0-0",
        "simpleValueType": true,
        "name": "schemaVersion",
        "type": "TEXT",
        "valueHint": "1-0-0"
      }
    ]
  },
  {
    "help": "The data properties for the schema. Provide keys and a data source for each property of the custom schema.",
    "alwaysInSummary": true,
    "displayName": "Schema Properties",
    "name": "schemaDataProperties",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Name",
        "name": "fieldName",
        "isUnique": true,
        "type": "TEXT",
        "valueHint": "propertyName"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "fieldData",
        "type": "TEXT",
        "valueHint": "data or variable containing the data"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Add Property"
  },
  {
    "displayName": "Advanced",
    "name": "advanced",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Conditions",
        "name": "processingConditions",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Variable",
            "name": "variable",
            "type": "TEXT"
          },
          {
            "selectItems": [
              {
                "displayValue": "Equals",
                "value": "equals"
              },
              {
                "displayValue": "Does Not Equal",
                "value": "dne"
              },
              {
                "displayValue": "Is Set",
                "value": "notNull"
              },
              {
                "displayValue": "Is Not Set",
                "value": "isNull"
              },
              {
                "displayValue": "Contains",
                "value": "contains"
              }
            ],
            "defaultValue": "",
            "displayName": "Condition",
            "name": "operation",
            "type": "SELECT"
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "type": "SIMPLE_TABLE",
        "newRowButtonText": "Add Condition"
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

//Check if this context should even be defined, if not return quickly. 
const processingConditions = data.processingConditions || [];
const continueProcessing = processingConditions.reduce((state, condition)=>{
		switch(condition.operation) {
          case 'equals':
            return condition.variable == condition.value;
          case 'dne':
            return condition.variable != condition.value;
          case 'isNull':
            return !condition.variable;
          case 'notNull':           
            return !!condition.variable;
          case 'contains':
            return condition.variable.indexOf(condition.value) > -1;
        }
}, true);

if(!continueProcessing) {
	return undefined;
}

const log = require('logToConsole');


const schemaProperties = data.schemaDataProperties || [];
const schemaNameSpace = data.schemaNameSpace || "com.company.events";
const schemaName = data.schemaName || "";
const schemaVersion = data.schemaVersion || "";
const schemaString = "iglu:" + schemaNameSpace + "/" + schemaName + "/jsonschema/" + schemaVersion;

const nameSpaceError = !data.schemaNameSpace;
const nameError = !data.schemaName;
const versionError = !schemaVersion;
const propertiesError = schemaProperties.length < 1;

if(nameError || versionError) {
  	log('SS) -- Snowplow Schema --');
	log('SS) DATA:', data);
	log(versionError ? 
        'SS) ERROR: No schema version provided' : 
        'SS) INFO: Using schema version: "' + schemaVersion + '"');
	return undefined;
}

const context = {
	schema: schemaString,
  	data:{}
};

schemaProperties.forEach(schemaProperty => {
  	if(schemaProperty.fieldName && schemaProperty.fieldData) { 
    	context.data[schemaProperty.fieldName] = schemaProperty.fieldData;
    }
});



return context;


___NOTES___

Created on 9/25/2019, 1:32:22 AM
