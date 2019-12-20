require('dotenv/config')
const authModel = require('../models/auth')
const JWT = require('jsonwebtoken')
const { response } = require('../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    createUser: async(req, res) => {
        try{
            const {
                phone_number,
                password,
                role
            } = req.body;

            const registerData = {
                phone_number,
                password,
                role
            };
            const data = await authModel.createUser(registerData);
            //console.log(data.fieldCount);
            
            const token = JWT.sign(
                { 
                    id: data.insertId,
                    role: registerData.role
                },
                process.env.JWT_SECRET,
                {
                    expiresIn: '24h'
                }
            )
            const JWTtoken = {
                token,
                status: 1
            }
            const authJWT = await authModel.saveStatusToken(JWTtoken)
            response(res, 200, {token: token});            
        }catch(error){
            console.log(error);
            
            response(res, 500, {message: "the server is error"}); 
        }
    },

    AuthUser: async(req, res) => {
        try{
            const {
                phone_number,
                password,
            } = req.body;
            

            const loginData = {
                phone_number,
                password
            };
            console.log(loginData);
            const status = await authModel.getValidUser(loginData)
            if(status.length !== 0){
                
                const token = JWT.sign(
                    { 
                        id: status[0].id,
                        role: status[0].role
                    },
                    process.env.JWT_SECRET,
                    {
                        expiresIn: '24h'
                    }
                )
                const JWTtoken = {
                    token,
                    status: 1
                }
                const authJWT = await authModel.saveStatusToken(JWTtoken)
                console.log(authJWT);
                
                response(res, 200, {token: token});            
            }
            else{
                response(res, 401, {message: "sign in is unvalid"});            
            }

        }catch(error){
            response(res, 500, {message: "the server is error"});  
        }
    },
    
    blacklistToken: async(req, res) => {
        try{
            const token = req.headers.authorization
            const verify = await authModel.getStatusToken(token)
            if(verify[0].status == 0){
                response(res, 401, {message: 'the user was logout'})
            } else {
                const JWTtoken = {
                    token,
                    status: 0
                }
                const result = await authModel.updateStatusToken(JWTtoken)
                response(res, 200, {message: 'the username logout successful'})
            }
        }catch(error) {
            response(res, 500, {message: 'the server is error'})
        }
    },
}