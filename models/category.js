const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../util/database');

// Define the Category model
const Category = sequelize.define('category', {
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
    thumbnail:{
        type: DataTypes.STRING,
        allowNull: true,
    }
});

module.exports = Category;
