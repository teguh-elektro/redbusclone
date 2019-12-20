const express = require('express')
const router = express.Router()
const path = require('path')
const {
  createUser,
  AuthUser,
  blacklistToken,
  
} = require('../controllers/auth')
const {
  readMyProfile,
  editMyProfile
} = require('../controllers/profile/myProfile')

const {
    tokenVerify
} = require('../controllers/jwt')

const {
  readCity,
  addDateOrder
} = require('../controllers/city/city')

const {
  readOrder,
  addOrder,
  editOrder
} = require('../controllers/order/order')

const {
  readAllBus,
  orderBus
} = require('../controllers/bus/bus')

const {
  readSeat,
  addSeat
} = require('../controllers/seat/seat')

const {
  readCustomer,
  addCustomer
} = require('../controllers/customer/customer')

const {
  readPay,
  addPay,
  editPay
} = require('../controllers/payment/payment')

const{
  readhelp,
  readanswer,
  readdetail
} = require('../controllers/help/help')

const { response } = require('../helper/send')


var directories = path.dirname('./');

router
    .post('/signup', createUser)
    .post('/signin', AuthUser)
    .post('/dateorder', addDateOrder)
    .delete('/logout', blacklistToken)
    .get('/profile', tokenVerify, readMyProfile)
    .put('/profile', tokenVerify, editMyProfile)
    .get('/city',  readCity)

    .get('/order',  readOrder) 
    .post('/order',  addOrder)
    .put('/order', editOrder)

    .get('/bus',  readAllBus)
    .post('/bus', orderBus)

    .get('/seat', readSeat)
    .post('/seat', addSeat)

    .get('/customer', readCustomer)
    .post('/customer', addCustomer)

    .get('/pay', readPay)
    .post('/pay', addPay)
    .put('/pay', editPay)

    .get('/help', readhelp)
    .get('/answer/:idCateg', readanswer)
    .get('/detail/:iddet', readdetail)

    .get('/test', (req, res) => {
        response(res, 200, {message: 'Hello, it\'s test'})
    });

router.get('/file/:name', function (req, res, next) {
        var options = {
          root: path.join(directories, 'Image'),
          dotfiles: 'deny',
          headers: {
            'x-timestamp': Date.now(),
            'x-sent': true
          }
        }
      
        var fileName = req.params.name
        res.sendFile(fileName, options, function (err) {
          if (err) {
            next(err)
          } else {
    
          }
        })
      })

module.exports = router