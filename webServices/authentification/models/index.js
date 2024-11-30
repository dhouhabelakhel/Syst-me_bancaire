const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('systeme_bancaire', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    define: { timestamps: false }
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

module.exports = db;
