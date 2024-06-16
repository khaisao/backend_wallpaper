const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../util/database');

const ItemCategory = sequelize.define('item_category', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    item_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'items',
            key: 'id'
        }
    },
    category_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'categories',
            key: 'id'
        }
    }
}, {
    timestamps: false,
    tableName: 'item_categories'
});

module.exports = ItemCategory;
