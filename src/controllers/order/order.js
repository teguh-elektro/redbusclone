require('dotenv/config')
const orderModel = require('../../models/order/order')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readOrder: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const result = await orderModel.readOrder(id)           
            response(res, 200, {data: result})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    },

    addOrder: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                status
            } = req.body;

            const body = {
                status,
                user_id: id
            };
            const result = await orderModel.addOrder(body)
            response(res, 200, {order_id: result.insertId})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    },
    
    editOrder: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                status,
                order_id,
            } = req.body;

            const body = {
                status,
                user_id: id,
                id: order_id
            };
            const result = await orderModel.editOrder(body)
            response(res, 200, {data: result})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    }
    
}