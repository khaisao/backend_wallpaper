const Category = require('../models/category');
const {sendResponse} = require('../util/response');

exports.uploadCategory = (req, res, next) => {
    const {name} = req.body;
    const thumbnail = req.files && req.files.thumbnail ? req.files.thumbnail[0].path.replace(/\\/g, '/') : null;

    const category = Category.build({
        name: name,
        thumbnail: thumbnail
    });
    category.save()
        .then(result => {
            sendResponse(res, [result], [], 200);
        })
        .catch(err => {
            sendResponse(res, [], [err.message], 500);
        });
};

exports.getCategory = (req, res, next) => {
    Category.findAll().then(result => {
        sendResponse(res, result);
    })
        .catch(err => {
            sendResponse(res, [], [error.message], 500);
        });
};

exports.deleteCategory = (req, res, next) => {
    const id = req.params.id;
    Category.findByPk(id)
        .then(category => {
            if (category) {
                return category.destroy();
            }
            return Promise.reject(new Error('Category not found'));
        })
        .then(() => {
            sendResponse(res, [], [], 200);
        })
        .catch(err => {
            sendResponse(res, [], [err.message], 500);
        });
};