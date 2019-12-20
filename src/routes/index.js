const express = require('express')
const router = express.Router()
const app = require('./auth')
var path = require('path');
const {
    tokenVerify
} = require('../controllers/jwt')

router.use('/v1/redbus', app)
router.get('/v1/redbus', (req, res) => {
    res.send('Hello World')
});
router.get('/v1/redbus/:id', (req, res) => {
    res.send('Hello World'+ req.params.id)
});

module.exports = router