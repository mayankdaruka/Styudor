const mongoose = require('mongoose');

const User = mongoose.Schema({
    firstname: {type: String, required: true},
    lastname: {type: String, required: true},
    firebaseId: {type: String, required: true},
    zipcode: {type: Number, required: true},
    tutor: {type: Boolean, required: true},
});

module.exports = mongoose.model('User', User);