const mongoose = require('mongoose');

const User = mongoose.Schema({
    fullname: {type: String, required: true},
    username: {type: String, required: true},
    profilePicture: {type: String, required: true},
    resume: {type: String, required: true},
    SATScore: {type: Number},
    ACTScore: {type: Number},
    MCATScore: {type: Number},
    GREScore: {type: Number},
    GMATScore: {type: Number},
    LSATScore: {type: Number}
});

module.exports = mongoose.model('User', User);