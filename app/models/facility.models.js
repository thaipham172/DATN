const { DataTypes } = require("sequelize");
const sequelize = require("../config/db.config.js");
const Rooms = require("../models/category.models");

const Facility = sequelize.define("facility", {
  Id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  RoomId: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Wifi: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Washer: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Bed: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Gym: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Kitchen: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Air: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Support: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Storage: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
  Bathroom: {
    type: DataTypes.NUMBER,
    allowNull: false
  },
}, {
  tableName: "facility" 
});

module.exports = Facility;

Facility.belongsTo(Rooms, { foreignKey: 'RoomId' });
