___INFO___

{
  "displayName": "Snowplow Context List",
  "description": "Function that generates a valid array of Snowplow Contexts from the supplied list",
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
    "help": "Add the GTM variables that contain the potential contexts you want to use into this table. They will be filtered to only include valid contexts to provide to Snowplow.",
    "alwaysInSummary": true,
    "displayName": "Desired Contexts",
    "name": "contextList",
    "simpleTableColumns": [
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "Context",
        "name": "contextObject",
        "isUnique": true,
        "type": "TEXT",
        "valueHint": ""
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Add Context"
  },
  {
    "help": "These settings allow you to deduplicate the list (helpful for contexts that might be both global and event driven depending on the context)",
    "displayName": "Deduplication Settings",
    "name": "deDupeSettings",
    "groupStyle": "NO_ZIPPY",
    "type": "GROUP",
    "subParams": [
      {
        "help": "Any items that appear in this list will be removed from the returned list.",
        "displayName": "Deduplication List",
        "simpleValueType": true,
        "name": "dedupeList",
        "type": "TEXT"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//const log = require('logToConsole');
//log('data =', data);

const contextGenerator = function(args) {
  	const deduplicationList = data.dedupeList ? data.dedupeList() : [];
    const filterGlobal = context => deduplicationList.filter(globalContext => globalContext.schema === context.schema).length === 0; 
  
  	const contextList = data.contextList || [];
  	const deduplicationFilter = data.dedupeList ? filterGlobal : ()=>{return true;};
   	
  	return contextList
      			.filter(contextListObject => {      
                  	return contextListObject && 
						contextListObject.contextObject && 
                      	contextListObject.contextObject.schema && 
                      	contextListObject.contextObject.data;
    				})
                .map(contextListObject => contextListObject.contextObject)
                .filter(deduplicationFilter);

};

return contextGenerator;


___NOTES___

Created on 9/25/2019, 1:42:26 AM
