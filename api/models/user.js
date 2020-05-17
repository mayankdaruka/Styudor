const mongoose = require('mongoose');

const User = mongoose.Schema({
    firstname: {type: String, required: true},
    lastname: {type: String, required: true},
    // profilePicture: {type: String, required: true},
    // resume: {type: String, required: true},
    // SATScore: {type: Number},
    // ACTScore: {type: Number},
    // MCATScore: {type: Number},
    // GREScore: {type: Number},
    // GMATScore: {type: Number},
    // LSATScore: {type: Number},
    firebaseId: {type: String, required: true},
    zipcode: {type: Number, required: true},
});

module.exports = mongoose.model('User', User);