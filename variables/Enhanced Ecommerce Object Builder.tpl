___INFO___

{
  "displayName": "Enhanced Ecommerce Object Builder",
  "description": "Build an Enhanced Ecommerce object when you need to dynamically construct it instead of using the dataLayer.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0VuaGFuY2VkLUVjb21tZXJjZS1PYmplY3QtQnVpbGRlci1TaW1vLUFoYXZh",
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
    "alwaysInSummary": true,
    "selectItems": [
      {
        "displayValue": "Promotion View",
        "value": "promoView"
      },
      {
        "displayValue": "Promotion Click",
        "value": "promoClick"
      },
      {
        "displayValue": "Impression View",
        "value": "impressions"
      },
      {
        "displayValue": "Impression Click",
        "value": "click"
      },
      {
        "displayValue": "Product Detail View",
        "value": "detail"
      },
      {
        "displayValue": "Add To Cart",
        "value": "add"
      },
      {
        "displayValue": "Remove From Cart",
        "value": "remove"
      },
      {
        "displayValue": "Checkout",
        "value": "checkout"
      },
      {
        "displayValue": "Checkout Option",
        "value": "checkout_option"
      },
      {
        "displayValue": "Purchase",
        "value": "purchase"
      },
      {
        "displayValue": "Refund",
        "value": "refund"
      }
    ],
    "displayName": "Type",
    "defaultValue": "detail",
    "simpleValueType": true,
    "name": "eecAction",
    "type": "SELECT"
  },
  {
    "simpleValueType": true,
    "name": "specifyCurrency",
    "checkboxText": "Set Currency Code",
    "type": "CHECKBOX",
    "subParams": [
      {
        "help": "Set currency code following the <strong>ISO 4217</strong> standard. See <a href=\"https://support.google.com/analytics/answer/6205902#supported-currencies\">here</a> for a list of supported currencies.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "specifyCurrency",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "Currency Code",
        "simpleValueType": true,
        "name": "currencyCode",
        "type": "TEXT"
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "detail"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "add"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "remove"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "checkout"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "checkout_option"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "purchase"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "refund"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "click"
      }
    ],
    "displayName": "Action Data",
    "name": "actionFieldGroup",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Generic",
        "name": "generic",
        "groupStyle": "ZIPPY_OPEN",
        "type": "GROUP",
        "subParams": [
          {
            "enablingConditions": [],
            "displayName": "Product Action List",
            "simpleValueType": true,
            "name": "list",
            "type": "TEXT"
          }
        ]
      },
      {
        "enablingConditions": [
          {
            "paramName": "eecAction",
            "type": "EQUALS",
            "paramValue": "checkout"
          },
          {
            "paramName": "eecAction",
            "type": "EQUALS",
            "paramValue": "checkout_option"
          }
        ],
        "displayName": "Checkout",
        "name": "checkout",
        "groupStyle": "ZIPPY_OPEN",
        "type": "GROUP",
        "subParams": [
          {
            "valueValidators": [
              {
                "type": "POSITIVE_NUMBER"
              }
            ],
            "displayName": "Checkout Step",
            "simpleValueType": true,
            "name": "checkout.step",
            "type": "TEXT"
          },
          {
            "valueValidators": [
              {
                "enablingConditions": [
                  {
                    "paramName": "eecAction",
                    "type": "EQUALS",
                    "paramValue": "checkout_option"
                  }
                ],
                "type": "NON_EMPTY"
              }
            ],
            "displayName": "Checkout Option",
            "simpleValueType": true,
            "name": "checkout.option",
            "type": "TEXT"
          }
        ]
      },
      {
        "enablingConditions": [
          {
            "paramName": "eecAction",
            "type": "EQUALS",
            "paramValue": "purchase"
          },
          {
            "paramName": "eecAction",
            "type": "EQUALS",
            "paramValue": "refund"
          }
        ],
        "displayName": "Purchase And Refund",
        "name": "purchaseRefund",
        "groupStyle": "ZIPPY_OPEN",
        "type": "GROUP",
        "subParams": [
          {
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "displayName": "Transaction ID",
            "simpleValueType": true,
            "name": "purchase.id",
            "type": "TEXT"
          },
          {
            "displayName": "Transaction Affiliation",
            "simpleValueType": true,
            "name": "purchase.affiliation",
            "type": "TEXT"
          },
          {
            "valueValidators": [
              {
                "args": [
                  "^(-?\\d+(\\.\\d+)?)?$"
                ],
                "errorMessage": "Currency must be formatted correctly, e.g. <strong>10</strong> or <strong>10.30</strong>.",
                "type": "REGEX"
              }
            ],
            "displayName": "Transaction Revenue",
            "simpleValueType": true,
            "name": "purchase.revenue",
            "type": "TEXT"
          },
          {
            "valueValidators": [
              {
                "args": [
                  "^(-?\\d+(\\.\\d+)?)?$"
                ],
                "errorMessage": "Currency must be formatted correctly, e.g. <strong>10</strong> or <strong>10.30</strong>.",
                "type": "REGEX"
              }
            ],
            "displayName": "Transaction Tax",
            "simpleValueType": true,
            "name": "purchase.tax",
            "type": "TEXT"
          },
          {
            "valueValidators": [
              {
                "args": [
                  "^(-?\\d+(\\.\\d+)?)?$"
                ],
                "errorMessage": "Currency must be formatted correctly, e.g. <strong>10</strong> or <strong>10.30</strong>.",
                "type": "REGEX"
              }
            ],
            "displayName": "Transaction Shipping",
            "simpleValueType": true,
            "name": "purchase.shipping",
            "type": "TEXT"
          },
          {
            "displayName": "Transaction Coupon",
            "simpleValueType": true,
            "name": "purchase.coupon",
            "type": "TEXT"
          }
        ]
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "click"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "detail"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "add"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "remove"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "checkout"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "checkout_option"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "purchase"
      },
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "refund"
      }
    ],
    "displayName": "Product Data",
    "name": "productGroup",
    "groupStyle": "ZIPPY_OPEN",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Products",
        "name": "productsData",
        "groupStyle": "ZIPPY_OPEN",
        "type": "GROUP",
        "subParams": [
          {
            "name": "products",
            "paramTableColumns": [
              {
                "param": {
                  "valueValidators": [
                    {
                      "type": "NON_EMPTY"
                    }
                  ],
                  "displayName": "ID (SKU)",
                  "simpleValueType": true,
                  "name": "id",
                  "type": "TEXT"
                },
                "isUnique": true
              },
              {
                "param": {
                  "displayName": "Name",
                  "simpleValueType": true,
                  "name": "name",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "Brand",
                  "simpleValueType": true,
                  "name": "brand",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "Category",
                  "simpleValueType": true,
                  "name": "category",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "Variant",
                  "simpleValueType": true,
                  "name": "variant",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "valueValidators": [
                    {
                      "args": [
                        "^(-?\\d+(\\.\\d+)?)?$"
                      ],
                      "errorMessage": "Currency must be formatted correctly, e.g. <strong>10</strong> or <strong>10.30</strong>.",
                      "type": "REGEX"
                    }
                  ],
                  "displayName": "Price",
                  "simpleValueType": true,
                  "name": "price",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "valueValidators": [
                    {
                      "args": [
                        "^([1-9]+)?$"
                      ],
                      "errorMessage": "Quantity must be an integer",
                      "type": "REGEX"
                    }
                  ],
                  "displayName": "Quantity",
                  "simpleValueType": true,
                  "name": "quantity",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "Coupon",
                  "simpleValueType": true,
                  "name": "coupon",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "valueValidators": [
                    {
                      "args": [
                        "^(\\d+)?$"
                      ],
                      "errorMessage": "Position must be an integer",
                      "type": "REGEX"
                    }
                  ],
                  "displayName": "Position",
                  "simpleValueType": true,
                  "name": "position",
                  "type": "TEXT"
                },
                "isUnique": false
              }
            ],
            "editRowTitle": "Edit Product",
            "type": "PARAM_TABLE",
            "newRowButtonText": "Add Product",
            "newRowTitle": "Add Product"
          }
        ]
      },
      {
        "displayName": "Product-scoped Custom Dimensions",
        "name": "customDimensionsGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "help": "Add Product-scoped Custom Dimensions to the <strong>products</strong> array of this hit. Use the <strong>Apply to SKUs</strong> column to include a comma-separated list of product IDs/SKUs to which the Product-scoped Custom Dimension should be applied. Leave the column value <strong>empty</strong> if you want the dimension to be applied to all products.",
            "simpleValueType": true,
            "name": "addCustomDimensions",
            "checkboxText": "Enable Product-scoped Custom Dimensions for products",
            "type": "CHECKBOX"
          },
          {
            "enablingConditions": [
              {
                "paramName": "addCustomDimensions",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "name": "customDimensions",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "defaultValue": "",
                "displayName": "Index",
                "name": "index",
                "isUnique": false,
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Value",
                "name": "value",
                "type": "TEXT"
              },
              {
                "valueValidators": [
                  {
                    "args": [
                      "^(\\S+)?$"
                    ],
                    "errorMessage": "There should be no whitespace in the applyTo value",
                    "type": "REGEX"
                  }
                ],
                "defaultValue": "",
                "displayName": "Apply to SKUs",
                "name": "applyTo",
                "type": "TEXT",
                "valueHint": "e.g. shirt1,shoes2,shoes3"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add Custom Dimension"
          }
        ]
      },
      {
        "displayName": "Product-scoped Custom Metrics",
        "name": "customMetricsGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "help": "Add Product-scoped Custom Metrics to the <strong>products</strong> array of this hit. Use the <strong>Apply to SKUs</strong> column to include a comma-separated list of product IDs/SKUs to which the Product-scoped Custom Metric should be applied. Leave the column value <strong>empty</strong> if you want the metric to be applied to all products.",
            "simpleValueType": true,
            "name": "addCustomMetrics",
            "checkboxText": "Enable Product-scoped Custom Metrics for products",
            "type": "CHECKBOX"
          },
          {
            "enablingConditions": [
              {
                "paramName": "addCustomMetrics",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "name": "customMetrics",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "defaultValue": "",
                "displayName": "Index",
                "name": "index",
                "isUnique": false,
                "type": "TEXT"
              },
              {
                "valueValidators": [
                  {
                    "type": "NUMBER"
                  }
                ],
                "defaultValue": "",
                "displayName": "Value",
                "name": "value",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Apply to SKUs",
                "name": "applyTo",
                "type": "TEXT",
                "valueHint": "e.g. shirt1,shoes2,shoes3"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add Custom Metric"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Impressions Viewed",
    "name": "impressionView",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Impressions",
        "name": "impressionsData",
        "groupStyle": "ZIPPY_OPEN",
        "type": "GROUP",
        "subParams": [
          {
            "name": "impressions",
            "paramTableColumns": [
              {
                "param": {
                  "valueValidators": [
                    {
                      "type": "NON_EMPTY"
                    }
                  ],
                  "displayName": "ID (SKU)",
                  "simpleValueType": true,
                  "name": "id",
                  "type": "TEXT"
                },
                "isUnique": true
              },
              {
                "param": {
                  "displayName": "Name",
                  "simpleValueType": true,
                  "name": "name",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "List",
                  "simpleValueType": true,
                  "name": "list",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "Brand",
                  "simpleValueType": true,
                  "name": "brand",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "Category",
                  "simpleValueType": true,
                  "name": "category",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "displayName": "Variant",
                  "simpleValueType": true,
                  "name": "variant",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "valueValidators": [
                    {
                      "args": [
                        "^(-?\\d+(\\.\\d+)?)?$"
                      ],
                      "errorMessage": "Currency must be formatted correctly, e.g. <strong>10</strong> or <strong>10.30</strong>.",
                      "type": "REGEX"
                    }
                  ],
                  "displayName": "Price",
                  "simpleValueType": true,
                  "name": "price",
                  "type": "TEXT"
                },
                "isUnique": false
              },
              {
                "param": {
                  "valueValidators": [
                    {
                      "args": [
                        "^(\\d+)?$"
                      ],
                      "errorMessage": "Position must be an integer",
                      "type": "REGEX"
                    }
                  ],
                  "displayName": "Position",
                  "simpleValueType": true,
                  "name": "position",
                  "type": "TEXT"
                },
                "isUnique": false
              }
            ],
            "editRowTitle": "Edit Impression",
            "type": "PARAM_TABLE",
            "newRowButtonText": "Add Impression",
            "newRowTitle": "Add Impression"
          }
        ]
      },
      {
        "displayName": "Product-scoped Custom Dimensions",
        "name": "icustomDimensionsGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "help": "Add Product-scoped Custom Dimensions to the <strong>impressions</strong> array of this hit. Use the <strong>Apply to SKUs</strong> column to include a comma-separated list of product IDs/SKUs to which the Product-scoped Custom Dimension should be applied. Leave the column value <strong>empty</strong> if you want the dimension to be applied to all products.",
            "simpleValueType": true,
            "name": "iaddCustomDimensions",
            "checkboxText": "Enable Product-scoped Custom Dimensions for impressions",
            "type": "CHECKBOX"
          },
          {
            "enablingConditions": [
              {
                "paramName": "iaddCustomDimensions",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "name": "icustomDimensions",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "defaultValue": "",
                "displayName": "Index",
                "name": "index",
                "isUnique": false,
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Value",
                "name": "value",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Apply to SKUs",
                "name": "applyTo",
                "type": "TEXT",
                "valueHint": "e.g. shirt1,shoes2,shoes3"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add Custom Dimension"
          }
        ]
      },
      {
        "displayName": "Product-scoped Custom Metrics",
        "name": "icustomMetricsGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "help": "Add Product-scoped Custom Metrics to the <strong>impressions</strong> array of this hit. Use the <strong>Apply to SKUs</strong> column to include a comma-separated list of product IDs/SKUs to which the Product-scoped Custom Metric should be applied. Leave the column value <strong>empty</strong> if you want the metric to be applied to all products.",
            "simpleValueType": true,
            "name": "iaddCustomMetrics",
            "checkboxText": "Enable Product-scoped Custom Metrics for impressions",
            "type": "CHECKBOX"
          },
          {
            "enablingConditions": [
              {
                "paramName": "iaddCustomMetrics",
                "type": "EQUALS",
                "paramValue": true
              }
            ],
            "name": "icustomMetrics",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "defaultValue": "",
                "displayName": "Index",
                "name": "index",
                "isUnique": false,
                "type": "TEXT"
              },
              {
                "valueValidators": [
                  {
                    "type": "NUMBER"
                  }
                ],
                "defaultValue": "",
                "displayName": "Value",
                "name": "value",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Apply to SKUs",
                "name": "applyTo",
                "type": "TEXT",
                "valueHint": "e.g. shirt1,shoes2,shoes3"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add Custom Metric"
          }
        ]
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "eecAction",
        "type": "EQUALS",
        "paramValue": "promoClick"
      }
    ],
    "displayName": "Promotions Clicked",
    "name": "promotionClick",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Promotions",
        "name": "promoClickData",
        "groupStyle": "ZIPPY_OPEN",
        "type": "GROUP",
        "subParams": [
          {
            "name": "promotionsClicked",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "defaultValue": "",
                "displayName": "ID",
                "name": "id",
                "isUnique": true,
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Name",
                "name": "name",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Creative",
                "name": "creative",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Position",
                "name": "position",
                "type": "TEXT"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add Promotion"
          }
        ]
      }
    ]
  },
  {
    "enablingConditions": [
      {
        "paramName": "eecAction",
        "type": "NOT_EQUALS",
        "paramValue": "promoClick"
      }
    ],
    "displayName": "Promotions Viewed",
    "name": "promotionView",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "displayName": "Promotions",
        "name": "promoViewData",
        "groupStyle": "ZIPPY_OPEN",
        "type": "GROUP",
        "subParams": [
          {
            "name": "promotions",
            "simpleTableColumns": [
              {
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "defaultValue": "",
                "displayName": "ID",
                "name": "id",
                "isUnique": true,
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Name",
                "name": "name",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Creative",
                "name": "creative",
                "type": "TEXT"
              },
              {
                "defaultValue": "",
                "displayName": "Position",
                "name": "position",
                "type": "TEXT"
              }
            ],
            "type": "SIMPLE_TABLE",
            "newRowButtonText": "Add Promotion"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Initialize returned object
const ecommerce = {
  currencyCode: data.currencyCode
};

// Build data objects
const action = data.eecAction;
const actionField = {
  list: data.list,
  step: data['checkout.step'],
  option: data['checkout.option'],
  id: data['purchase.id'],
  affiliation: data['purchase.affiliation'],
  revenue: data['purchase.revenue'],
  tax: data['purchase.tax'],
  shipping: data['purchase.shipping'],
  coupon: data['purchase.coupon']
};

// Map Custom Dimensions and Metrics to their products.
const products = data.products;
if (products && data.customDimensions) {
  data.customDimensions.forEach(d => {
    const applyTo = d.applyTo.split(',');
    products.forEach(p => {
      if (applyTo.indexOf(p.id) > -1 || applyTo[0] === '') {
        p['dimension' + d.index] = d.value;
      }
    });
  });
}
if (products && data.customMetrics) {
  data.customMetrics.forEach(m => {
    const applyTo = m.applyTo.split(',');
    products.forEach(p => {
      if (applyTo.indexOf(p.id) > -1 || applyTo[0] === '') {
        p['metric' + m.index] = m.value;
      }
    });
  });
}

// Map Custom Dimensions and Metrics to their impressions.
const impressions = data.impressions;
if (impressions && data.icustomDimensions) {
  data.icustomDimensions.forEach(d => {
    const applyTo = d.applyTo.split(',');
    impressions.forEach(i => {
      if (applyTo.indexOf(i.id) > -1 || applyTo[0] === '') {
        i['dimension' + d.index] = d.value;
      }
    });
  });
}
if (impressions && data.icustomMetrics) {
  data.icustomMetrics.forEach(m => {
    const applyTo = m.applyTo.split(',');
    impressions.forEach(i => {
      if (applyTo.indexOf(i.id) > -1 || applyTo[0] === '') {
        i['metric' + m.index] = m.value;
      }
    });
  });
}

const promotionViews = data.promotions;
const promotionClicks = data.promotionsClicked;

// Build ecommerce object
if (data.eecType !== 'impressions' && data.eecType !== 'promoView' && data.eecType !== 'promoClick') {
  ecommerce[action] = {};
  ecommerce[action].actionField = actionField;
  ecommerce[action].products = products;
}

ecommerce.impressions = impressions;

if (promotionViews) {
  ecommerce.promoView = {
    promotions: promotionViews
  };
}

if (promotionClicks) {
  ecommerce.promoClick = {
    promotions: promotionClicks
  };
}

return {
  ecommerce: ecommerce
};


___NOTES___

Created on 25/06/2019, 18:49:06
