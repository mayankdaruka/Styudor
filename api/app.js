const express = require('express');
const app = express();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const usersRoutes = require('./routes/users');

require('dotenv').config();
app.use(bodyParser.json());

app.use('/users', usersRoutes);

mongoose.connect(process.env.DB_CONNECT, {useNewUrlParser: true, useUnifiedTopology: true}, () => {
    console.log("Database Connected!");
});

app.listen(3000, () => {
    console.log("Server started!");
});