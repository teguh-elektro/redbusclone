const conn = require('../../config/db')

module.exports = {
    readSeat: async(id) => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT seat_number FROM seat_order WHERE bus_id = ?`, id, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    
    addSeat: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO seat_order SET ?`, body, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }
}


