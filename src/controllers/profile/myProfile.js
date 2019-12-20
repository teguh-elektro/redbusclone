require('dotenv/config')
const userModel = require('../../models/profile/myProfile')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readMyProfile: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const result = await userModel.readUserBy(id)
            
            response(res, 200, result)
        }catch(error){
            
            response(res, 500, {message: "the server is error"})
        }
    },

    editMyProfile: async(req, res) => {
        const token = req.headers.authorization
        try{
            let data = JWT.verify(token, process.env.JWT_SECRET);
            let id = data.id;
            const {
                email,
                name,
                date_of_birth,
                gender
            } = req.body;

            const body = {
                email,
                name,
                date_of_birth,
                gender
            };

            const result = await userModel.editUserBy(body, id)
            
            response(res, 200, {message:"your profile was edited"})
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"})
        }
    }
}