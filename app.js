const express = require('express');
const app = express();
const path = require('path');
const sequelize = require('./util/database');

require('dotenv').config()

const port = process.env.PORT || 5000

const Wallpaper = require('./models/wallpaper');
const Category = require('./models/category');
const ItemCategory = require('./models/item-category');
const ItemType = require('./models/item-type');

Wallpaper.belongsToMany(Category, { through: ItemCategory, foreignKey: 'item_id' });
Category.belongsToMany(Wallpaper, { through: ItemCategory, foreignKey: 'category_id' });

Wallpaper.belongsTo(ItemType, { foreignKey: 'type_id', targetKey: 'id' });
ItemType.hasMany(Wallpaper, { foreignKey: 'type_id', sourceKey: 'id' });

const categoryRoutes = require('./routes/category');

app.use('/api/category', categoryRoutes);

app.get('/', (req, res) => {
    res.send('Hello Wallpaper!')
})
app.listen(port, () => {
    console.log("Listening on port " + port)
})

sequelize.sync()
    .then(result => {
        console.log('Database & tables created!');
    })
    .catch(err => {
        console.log(err);
    });