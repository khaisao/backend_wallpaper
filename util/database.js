const Sequelize = require('sequelize');


// const sequelize = new Sequelize('nhdatvho_prank', 'root', '', {
//     host: 'localhost',
//     dialect: 'mysql',
//     // Nếu bạn sử dụng user và password khác:
//     // username: 'nhdatvho_nhdatvho',
//     // password: 'nhdatvho2024',
// });

const sequelize = new Sequelize('nhdatvho_wallpaper', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
});

module.exports = sequelize;
