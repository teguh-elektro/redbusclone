const conn = require('../../config/db')

module.exports = {
    readCustomer: async(id, order_id) => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT * FROM info_order WHERE user_id = ? AND order_id = ?`, [id, order_id], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    
    addCustomer: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO info_order SET ?`, body, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    editCustomer: async(body, id) => {
        return new Promise ((resolve, reject) => {
            conn.query(`UPDATE info_order SET ? WHERE id = ?`,[ body, id ], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }
}


