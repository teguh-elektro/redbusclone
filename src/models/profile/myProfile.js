const conn = require('../../config/db')

module.exports = {
    readUserBy: async(id) => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT * FROM user WHERE id = ?`, id, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    editUserBy: async(body, id) => {
        return new Promise ((resolve, reject) => {
            conn.query(`UPDATE user SET ? WHERE id = ?`, [body, id], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }


}


