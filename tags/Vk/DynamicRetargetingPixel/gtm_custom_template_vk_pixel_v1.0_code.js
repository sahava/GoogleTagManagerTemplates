//api
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const makeTableMap = require('makeTableMap');
const getUrl = require('getUrl');
const getQueryParameters = require('getQueryParameters');
const makeInteger = require('makeInteger');
const makeString = require('makeString');
const callLater = require('callLater');

//user settings object
const settings = {
    event: data.event,
    pixelIDs: data.pixelIDs,
    priceListId: data.priceListId,
    fewPriceLists: data.fewPriceLists,
    priceListIds: data.priceListIds === undefined ? data.priceListIds : makeTableMap(data.priceListIds,'hostname','priceListId'),
    ecommerceUse: data.ecommerceUse,
    eventEcommerce: data.eventEcommerce,
    siteSearchQueryParam: data.siteSearchQueryParam
};

//main object
const pixel = {
    //get page host method
    getPageHostname: () => getUrl('host'),

    //get VK object method
    getVK: () => copyFromWindow('VK'),

    //set VK openapi.js callback method
    setVkAsyncInit: () => {
        setInWindow('vkAsyncInit', pixel.sendEvent);
    },

    //get site search phrase method
    getSiteSearchPhrase: () => {
        if (settings.event === 'view_search') return getQueryParameters(settings.siteSearchQueryParam);
        else return undefined;
    },

    //get event parameters method
    getEventParams: (products, currencyCode, revenue) => {
        const eventParamsClean= {};
        const eventParams = {
            products: eventProducts.getProductParams(products),
            category_ids: eventProducts.getCategoryString(products),
            currency_code: currencyCode,
            total_price: eventProducts.getTotalPrice(products, revenue),
            search_string: pixel.getSiteSearchPhrase()
        };
        if (eventParams.products !== undefined) eventParamsClean.products = eventParams.products;
        if (eventParams.category_ids !== undefined) eventParamsClean.category_ids = eventParams.category_ids;
        if (eventParams.currency_code !== undefined) eventParamsClean.currency_code = eventParams.currency_code;
        if (eventParams.total_price !== undefined) eventParamsClean.total_price = eventParams.total_price;
        if (eventParams.search_string !== undefined) eventParamsClean.search_string = eventParams.search_string;
        return eventParamsClean;
    },

    //get price list ID method
    getPriceListId: hostname => {
        if (settings.fewPriceLists) return settings.priceListIds[hostname];
        else return settings.priceListId;
    },

    //VK openapi.js init method
    openapiInit: () => {
        injectScript('https://vk.com/js/api/openapi.js?159', pixel.setVkAsyncInit, data.gtmOnFailure, 'vkPixel');
        setInWindow('openapiInject', 1);
    },

    //send event method
    sendEvent: () => {
        if (settings.event === 'hit') {
            settings.pixelIDs.split(',').forEach(p => {
                callInWindow('VK.Retargeting.Init',p);
                callInWindow('VK.Retargeting.Hit');
            });
        } else {
            const pricelist = pixel.getPriceListId(pixel.getPageHostname());
            const name = settings.event;
            let products = [];
            if(settings.ecommerceUse) products = name === 'view_home' || name === 'view_category' || name === 'view_search' || name === 'view_other' ? settings.eventEcommerce : settings.eventEcommerce.products;
            else products = undefined;
            const currencyCode = settings.ecommerceUse ? settings.eventEcommerce.currencyCode : undefined;
            const revenue = (settings.ecommerceUse && name === 'purchase') ? settings.eventEcommerce.actionField.revenue : undefined;
            const eventParams = settings.ecommerceUse ? pixel.getEventParams(products, currencyCode, revenue) : undefined;
            settings.pixelIDs.split(',').forEach(p => {
                callInWindow('VK.Retargeting.Init',p);
                callInWindow('VK.Retargeting.ProductEvent', pricelist, name, eventParams);
            });
        }
    },

    //pixel start method
    start: () => {
        if (pixel.getVK() === undefined && copyFromWindow('openapiInject') !== 1) {
            pixel.openapiInit();
            data.gtmOnSuccess();
        } else if (pixel.getVK() === undefined && copyFromWindow('openapiInject') === 1) {
            if (pixel.count < 50) {
                callLater(pixel.start);
                pixel.count++;
            } else return;
        } else {
            pixel.sendEvent();
            data.gtmOnSuccess();
        }
    },

    //start attempts counter
    count: 0
};

//object with methods for processing an array of event products
const eventProducts = {
    //get product parameters method
    getProductParams: products => {
        const arr = [];
        products.forEach(i => {
            const productParamsClean = {};
            const productParams = {
                id: makeString(i.id),
                group_id: makeString(i.brand),
                price: makeInteger(i.price * 100) / 100
            };
            if (productParams.id !== 'undefined') productParamsClean.id = productParams.id;
            if (productParams.group_id !== 'undefined') productParamsClean.group_id = productParams.group_id;
            if (productParams.price !== 0) productParamsClean.price = productParams.price;
            arr.push(productParamsClean);
        });
        return arr;
    },

    //get unique product categories method. Return a string. String type is 'a,b,c'
    getCategoryString: products => {
        let categoryId = '';
        const check = [];
        products.forEach(i => {
            if(check.indexOf(i.category) === -1) {
                check.push(i.category);
                categoryId += ',' + i.category;
            }
        });
        return categoryId.slice(1);
    },

    //get total price method
    getTotalPrice: (products, revenue) => {
        let sumPrice = 0;
        if (revenue !== undefined ) return makeInteger(revenue * 100) / 100;
        else {
            products.forEach(i => {
                if (i.hasOwnProperty('quantity')) sumPrice += (makeInteger(i.price * 100) / 100) * makeInteger(i.quantity);
                else sumPrice += makeInteger(i.price * 100) / 100;
            });
            return sumPrice;
        }
    }
};

//let's run the pixel :)
pixel.start();