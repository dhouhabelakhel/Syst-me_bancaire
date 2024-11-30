const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('./index'); 

class user extends Model {}

user.init({
    id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        autoIncrement: true,
        unique: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    sequelize, // Ensure this is the Sequelize instance
    modelName: 'user'
});

module.exports = user;
