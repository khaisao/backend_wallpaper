const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../util/database');

// Define the Category model
const Country = sequelize.define('country', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    },
    countryCode:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    thumbnail: {
        type: DataTypes.STRING,
        allowNull: false,
    }
});

module.exports = Country;
