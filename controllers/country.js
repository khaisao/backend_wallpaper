const Country = require('../models/country');
const {sendResponse} = require('../util/response');

exports.getCountry = (req, res, next) => {
    Country.findAll().then(result => {
        sendResponse(res, result);
    }).catch(err => {
        sendResponse(res, [], [error.message], 500);
    });
};

