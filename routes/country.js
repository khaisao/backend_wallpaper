const path = require('path');

const express = require('express');

const countryController = require('../controllers/country');
const router = express.Router();
const upload = require("../util/multerStorage");

router.get('/', countryController.getCountry);

module.exports = router;
