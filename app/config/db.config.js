const Sequelize = require('sequelize');
const sequelize = new Sequelize('hotel_nodejs', 'root', '', {
  dialect: 'mysql',
  host: 'localhost',
  logging: false, // tắt log
});

module.exports = sequelize;