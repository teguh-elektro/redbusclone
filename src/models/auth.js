const conn = require('../config/db')

module.exports = {
    createUser: (body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO user SET phone_number = ?, password = ?, role = ?`, [body.phone_number, body.password, body.role], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    getValidUser: (body) =>{
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT id, role FROM user WHERE phone_number = ? AND password = ?`, [body.phone_number, body.password], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    getStatusToken: (token) => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT status FROM token WHERE token = ?`, token, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    saveStatusToken: (body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO token SET token = ?, status = ?`, [body.token, body.status], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    updateStatusToken: (body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`UPDATE token SET status = ? WHERE token = ?`, [body.status, body.token], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }
}