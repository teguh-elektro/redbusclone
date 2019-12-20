require('dotenv/config')
const seatModel = require('../../models/seat/seat')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readSeat: async(req, res) => {
        try{
            const id = req.body.bus;
            const result = await seatModel.readSeat(id)       
            response(res, 200, {data: result})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    },

    addSeat: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                seat,
                bus,
                order_id
            } = req.body;

            const body = {
                seat_number: seat,
                bus_id: bus,
                user_id: id,
                order_id
            };
            const result = await seatModel.addSeat(body)
            response(res, 200, {message: "the seat order was added"})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    }
    
}