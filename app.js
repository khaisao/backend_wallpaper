const express = require('express');
const app = express();
const path = require('path');
const sequelize = require('./util/database');

require('dotenv').config()

const port = process.env.PORT || 5000

app.use(express.json()); // Đối với dữ liệu JSON
app.use(express.urlencoded({extended: true}));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

const Wallpaper = require('./models/wallpaper');
const Category = require('./models/category');
const ItemCategory = require('./models/item-category');
const ItemCountry = require('./models/item-country');
const Country = require('./models/country');

Wallpaper.belongsToMany(Category, { through: ItemCategory, foreignKey: 'wallpaperId' });
Category.belongsToMany(Wallpaper, { through: ItemCategory, foreignKey: 'categoryId' });

Wallpaper.belongsToMany(Country, { through: ItemCountry, foreignKey: 'wallpaperId' });
Country.belongsToMany(Wallpaper, { through: ItemCountry, foreignKey: 'countryId' });


const categoryRoutes = require('./routes/category');
const wallpaperRoutes = require('./routes/wallpaper');
const countryRoutes = require('./routes/country');

app.use('/api/category', categoryRoutes);
app.use('/api/wallpaper', wallpaperRoutes);
app.use('/api/country', countryRoutes);

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