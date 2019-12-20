const conn = require('../../config/db')

module.exports = {
    readBus: async(origin = '', destination = '', date = '') => {
        return new Promise ((resolve, reject) => {
            conn.query(`
        SELECT  bs.id, 
            bs.name AS 'bus_name',
            bs.logo,
            bs.seat,
            ts1.name AS 'origin_terminal', 
            cl1.city_name AS 'origin_city', 
            ts2.name AS 'destination_terminal',  
            cl2.city_name AS 'destination_city', 
            bt.arrive, 
            bt.depart, 
            bt.price 
        FROM bus_track AS bt 
        LEFT JOIN terminal_list AS ts1 ON ts1.id = bt.origin_terminal_id 
        LEFT JOIN terminal_list AS ts2 ON ts2.id = bt.destination_terminal_id
        LEFT JOIN bus AS bs ON bt.bus_id = bs.id
        LEFT JOIN city_list AS cl1 ON ts1.city_id = cl1.id
        LEFT JOIN city_list AS cl2 ON ts2.city_id = cl2.id
        WHERE cl1.city_name LIKE '${origin}%' 
        AND cl2.city_name LIKE '${destination}%' 
        AND bt.arrive >= '${date}' 
        ORDER BY depart ASC LIMIT 10 OFFSET 0;`,
        (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    addBusOrder: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO bus_order SET ?`, body, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }
}


