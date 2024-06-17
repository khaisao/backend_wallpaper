const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../util/database');

const ItemCategory = sequelize.define('item_category', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    wallpaperId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'items',
            key: 'id'
        }
    },
    categoryId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'category',
            key: 'id'
        }
    }
});

module.exports = ItemCategory;
