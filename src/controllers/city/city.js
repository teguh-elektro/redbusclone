require('dotenv/config')
const cityModel = require('../../models/city/city')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readCity: async(req, res) => {
        try{
            const result = await cityModel.readCity()           
            response(res, 200, {city: result})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    },

    addDateOrder: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                origin,
                destination,
                date,
                order_id
            } = req.body;

            const body = {
                origin,
                destination,
                date,
                user_id: id,
                order_id
            };

            const result = await cityModel.addDateOrder(body)
            
            response(res, 200, result)
        }catch(error){
            console.log(error);
            response(res, 500, {message: "the server is error"})
        }
    }
    
}