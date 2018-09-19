const DAO = require('../model/DAO');
class DA{
    getOrder2() {
        return DAO('select * from `order`,orderdetails where order.oid = orderdetails.oid', []);
    }
    addOrder1(orderdetails) {
        return DAO("insert into orderdetails values(?,?,?,?)",
            [orderdetails.rid,orderdetails.rnum,orderdetails.oid,orderdetails.pid ]);
    }
}
module.exports = new DA();
