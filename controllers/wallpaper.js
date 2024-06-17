const Wallpaper = require('../models/wallpaper');
const ItemCategory = require('../models/item-category');
const ItemCountry = require('../models/item-country');
const {sendResponse} = require('../util/response');
const Category = require("../models/category");
const Country = require("../models/country");
const {Op} = require('sequelize');

exports.createWallpaper = async (req, res, next) => {
    let {title, categoryIds, countryIds, isHot, isRecommend, isPremium} = req.body;
    const fileWallpaper = req.files && req.files.fileWallpaper ? req.files.fileWallpaper[0].path.replace(/\\/g, '/') : null;


    categoryIds = JSON.parse(categoryIds);
    countryIds = JSON.parse(countryIds);

    try {
        const wallpaper = await Wallpaper.create({
            title: title,
            filePath: fileWallpaper,
            isHot: isHot,
            isRecommend: isRecommend,
            isPremium: isPremium
        });

        if (categoryIds && Array.isArray(categoryIds)) {
            const itemCategories = categoryIds.map(categoryId => ({
                wallpaperId: wallpaper.id,
                categoryId: categoryId
            }));
            await ItemCategory.bulkCreate(itemCategories);
        }

        if (countryIds && Array.isArray(countryIds)) {
            const wallpaperCountries = countryIds.map(countryId => ({
                wallpaperId: wallpaper.id,
                countryId: countryId
            }));
            await ItemCountry.bulkCreate(wallpaperCountries);
        }

        sendResponse(res, [wallpaper], [], 200);
    } catch (err) {
        sendResponse(res, [], [err.message], 500);
    }
};

exports.getWallpaper = async (req, res, next) => {
    Wallpaper.findAll({
        include: [
            {
                model: Category,
                through: { attributes: [] } // This will not include the ItemCategory table in the result
            },
            {
                model: Country,
                through: { attributes: [] } // This will not include the ItemCountry table in the result
            }
        ]
    }).then(result => {
        sendResponse(res, result);
    })
        .catch(err => {
            sendResponse(res, [], [err.message], 500);
        });
};

//Search by category and recommend
exports.getWallpaperByCategory = async (req, res, next) => {
    const categoryIds = JSON.parse(req.query.categoryIds);
    const isRecommend = req.query.isRecommend === 'true' ? true : null;

    try {
        const wallpapers = await Wallpaper.findAll({
            where: isRecommend !== null ? {isRecommend: isRecommend} : {},
            include: [
                {
                    model: Category,
                    where: {id: {[Op.in]: categoryIds}},
                    through: {attributes: []} // This will not include the ItemCategory table in the result
                }
            ]
        });

        sendResponse(res, wallpapers, [], 200);
    } catch (err) {
        sendResponse(res, [], [err.message], 500);
    }
};

exports.getWallpaperByCountry = async (req, res, next) => {
    const countryIds = JSON.parse(req.query.countryIds);
    const isHot = req.query.isHot === 'true' ? true : null;

    try {
        const wallpapers = await Wallpaper.findAll({
            where: isHot !== null ? {isHot: isHot} : {},
            include: [
                {
                    model: Country,
                    where: {id: {[Op.in]: countryIds}},
                    through: {attributes: []} // This will not include the ItemCategory table in the result
                }
            ]
        });

        sendResponse(res, wallpapers, [], 200);
    } catch (err) {
        sendResponse(res, [], [err.message], 500);
    }
};