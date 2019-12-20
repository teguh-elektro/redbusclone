const conn = require('../../config/db')

module.exports = {
    readPay: async() => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT * FROM payment_order`, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    
    addPay: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO payment_order SET ?`, body, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    editPay: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`UPDATE payment_order SET paid = ? WHERE order_id = ? AND user_id = ?`,[body.paid, body.order_id, body. user_id], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    totalPay: async(order_id, user_id) => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT SUM(bt.price) AS total FROM info_order AS io 
            LEFT JOIN bus_track AS bt ON bt.id = io.bus_id 
            WHERE io.order_id = ? AND io.user_id = ?`, [order_id, user_id], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
}


