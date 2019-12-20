const conn = require('../../config/db')
module.exports = {
    readhelp: (body) => {
        return new Promise((resolve, reject) => {
            conn.query(`SELECT * FROM help WHERE id_category`, body, 
            (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    readanswer: (idCategory) => {
        return new Promise((resolve, reject) => {
            conn.query(`SELECT * FROM help a INNER JOIN questions b ON a.id_category = b.id_category  WHERE a.id_category = ?`, idCategory, 
            (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    readdetail: (idDetail) => {
        return new Promise((resolve, reject) => {
            conn.query(`SELECT * FROM help a INNER JOIN questions b ON a.id_category = b.id_category  WHERE b.id_detail = ?`, idDetail, 
            (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }
}