const path = require('path');

const express = require('express');

const categoryController = require('../controllers/category');
const router = express.Router();
const upload = require("../util/multerStorage");

router.post('/', upload.fields([
    {name: 'thumbnail', maxCount: 1},
]), categoryController.uploadCategory);

router.get('/', categoryController.getCategory);

router.delete('/:id', categoryController.deleteCategory);

module.exports = router;
