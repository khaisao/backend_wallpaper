const {Sequelize, DataTypes} = require('sequelize');
const sequelize = require('../util/database');

// Define the Wallpaper model
const Wallpaper = sequelize.define('wallpaper', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    title: {
        type: DataTypes.STRING,
        allowNull: false
    },
    filePath: {
        type: DataTypes.STRING,
        allowNull: false
    },
    isHot:{
        type: DataTypes.BOOLEAN,
        allowNull: true,
    },
    isRecommend:{
        type: DataTypes.BOOLEAN,
        allowNull: true,
    },
    isPremium:{
        type: DataTypes.BOOLEAN,
        allowNull: true,
    }
});

module.exports = Wallpaper;
