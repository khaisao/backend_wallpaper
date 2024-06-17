const path = require('path');

const express = require('express');

const wallpaperController = require('../controllers/wallpaper');
const router = express.Router();
const upload = require("../util/multerStorage");

router.post('/', upload.fields([
    {name: 'fileWallpaper', maxCount: 1},
]), wallpaperController.createWallpaper);


router.get('/', wallpaperController.getWallpaper);

router.get('/searchByCategory', wallpaperController.getWallpaperByCategory)

router.get('/searchByCountry', wallpaperController.getWallpaperByCountry)

module.exports = router;
