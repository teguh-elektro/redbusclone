require('dotenv/config')
const customerModel = require('../../models/customer/customer')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readCustomer: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {order_id} = req.body;
            const result = await customerModel.readCustomer(id, order_id)           
            response(res, 200, {city: result})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    },

    addCustomer: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                email,
                phone_number,
                name,
                age,
                gender,
                order_id,
                bus
            } = req.body;

            const body = {
                email,
                phone_number,
                name,
                age,
                gender,
                user_id: id,
                order_id,
                bus_id: bus
            };

            const result = await customerModel.addCustomer(body)
            
            response(res, 200, {message: "the data was added"})
        }catch(error){
            console.log(error);
            response(res, 500, {message: "the server is error"})
        }
    }
    
}