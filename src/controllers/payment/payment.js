require('dotenv/config')
const payModel = require('../../models/payment/payment')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readPay: async(req, res) => {
        try{
            const result = await payModel.readPay()           
            response(res, 200, {city: result})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    },

    addPay: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                order_id
            } = req.body;

            const total_pay = await payModel.totalPay(order_id, id);
            console.log(total_pay[0].total);
            
            const body = {
                total: total_pay[0].total,
                paid: 0,
                user_id: id,
                order_id
            };
             
            const result = await payModel.addPay(body)
            
            response(res, 200, result)
        }catch(error){
            console.log(error);
            response(res, 500, {message: "the server is error"})
        }
    },
    editPay: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                paid,
                order_id
            } = req.body;

            const body = {
                paid,
                user_id: id,
                order_id
            };
             console.log(body);
             
            const result = await payModel.editPay(body)
            
            response(res, 200, result)
        }catch(error){
            console.log(error);
            response(res, 500, {message: "the server is error"})
        }
    }
    
}//paid, order_id, id 