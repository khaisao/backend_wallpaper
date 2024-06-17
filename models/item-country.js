const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../util/database');

const ItemCountry = sequelize.define('item_country', {
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
            model: 'wallpapers',
            key: 'id'
        }
    },
    countryId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'country',
            key: 'id'
        }
    }
});

module.exports = ItemCountry;
