require('dotenv/config')
const engineerModel = require('../../models/help/help')
const JWT = require('jsonwebtoken')
const { response } = require('../../helper/send')
const bcrypt = require('bcrypt');
const multer = require('multer')
const fs = require('fs')

module.exports = {

    readhelp: async(req, res) => {
        try{
            const result = await engineerModel.readhelp()
            res.send(result)
        }catch(error) {
        
            res.send(error)
        }
    },
    readanswer: async(req, res) => {
        const idCategory = req.params.idCateg
        try{
            const result = await engineerModel.readanswer(idCategory)
            res.send(result)
        }catch(error) {
        
            res.send(error)
        }
    },
    readdetail: async(req, res) => {
        const idDetail = req.params.iddet
        try{
            const result = await engineerModel.readdetail(idDetail)
            res.send(result)
        }catch(error) {
        
            res.send(error)
        }
    }
}