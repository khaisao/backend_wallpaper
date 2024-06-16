const {Sequelize, DataTypes} = require('sequelize');
const sequelize = require('../util/database');

const ItemType = sequelize.define('item_type', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    type_name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    }
}, {
    timestamps: false,
    tableName: 'item_types'
});

module.exports = ItemType;
