const conn = require('../../config/db')

module.exports = {
    readOrder: async(id) => {
        return new Promise ((resolve, reject) => {
            conn.query(`SELECT 
            ol.id, 
            ol.status,
            io.name,
            bs.name AS 'bus_name',
            bs.seat,
            ts1.name AS 'origin_terminal', 
            ts2.name AS 'destination_terminal',  
            bt.arrive, 
            bt.depart, 
            so.seat_number,
            bt.price, 	
            po.total,
            po.paid
        FROM order_list AS ol 
        LEFT JOIN bus_order AS bo ON bo.order_id = ol.id AND bo.user_id = ol.user_id
        LEFT JOIN bus_track AS bt ON bt.id = bo.bus_track_id
        LEFT JOIN bus AS bs ON bs.id = bt.bus_id
        LEFT JOIN terminal_list AS ts1 ON ts1.id = bt.origin_terminal_id 
        LEFT JOIN terminal_list AS ts2 ON ts2.id = bt.destination_terminal_id
        LEFT JOIN seat_order AS so ON so.order_id = ol.id AND bo.user_id = ol.user_id
        LEFT JOIN payment_order AS po ON po.order_id = ol.id AND po.user_id = ol.user_id
        LEFT JOIN info_order AS io ON io.order_id = ol.id AND io.user_id = ol.user_id
        WHERE ol.user_id = ? ORDER BY ol.id DESC;`, id, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },
    
    addOrder: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`INSERT INTO order_list SET ?`, body, (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    },

    editOrder: async(body) => {
        return new Promise ((resolve, reject) => {
            conn.query(`UPDATE order_list SET status = ? WHERE id = ? AND user_id = ?`, [body.status, body.id, body.user_id], (err, result) => {
                if(err) reject(err)
                resolve(result)
            })
        })
    }
}


