const conn = require('../../config/db')

module.exports = {
    readCity: async() => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT * FROM city_list`, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    addDateOrder: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO date_order SET ?`, body, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }
}


