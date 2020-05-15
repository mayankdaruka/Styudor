const express = require('express');
const router = express.Router();
const User = require('../models/user');

router.post('/new', async (req, res) => {
    console.log("req body" + req.body);
    const newUser = await User.create(req.body);
    res.send(newUser.id);
});

router.get('/', (req, res) => {
    // console.log(req);
    User.find().then((doc) => {
        res.send(doc);
        // console.log(doc);
    }).catch((err) => {
        res.status(400).send(err);
    });
});

router.get('/id', (req, res) => {
    User.findById(req.body.id, (err, doc) => {
        if (err) {
            return res.status(400).send("error");
        }
        res.send(doc);
        console.log(doc);
    })
});

router.get('/firebaseid', (req, res) => {
    User.find({ 'firebaseId': req.body.firebaseId }, (err, doc) => {
        if (err) {
            return res.status(400).send("error");
        }
        res.send(doc);
    });
});

module.exports = router;