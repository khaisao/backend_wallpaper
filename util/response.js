// response.js
exports.sendResponse = (res, data = [], errors = [], statusCode = 200) => {
    const response = {
        data: data,
        errors: errors
    };

    return res.status(statusCode).json(response);
};