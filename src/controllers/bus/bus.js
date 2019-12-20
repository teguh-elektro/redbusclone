require('dotenv/config')
const busModel = require('../../models/bus/bus')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readAllBus: async(req, res) => {
        try{
            const origin = req.query.origin;
            const destination =  req.query.destination;
            const date = req.query.date;
            const result = await busModel.readBus(origin, destination, date)           
            response(res, 200, {bus: result})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    },
    orderBus: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                bus,
                order_id
            } = req.body;

            const body = {
                bus_track_id: bus,
                user_id: id,
                order_id
            };

            const result = await busModel.addBusOrder(body)
            response(res, 200, {message: "the bus order was created"})
        }catch(error){
            console.log(error);
            response(res, 500, {message: "the server is error"})
        }
    }  
}