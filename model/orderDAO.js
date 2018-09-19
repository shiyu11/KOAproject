const DAO = require('../model/DAO');
class DB {
    getOrder1() {
        return DAO('select * from `order`', []);
    }

    addOrder(order) {
        return DAO("insert into `order`(oid,method,note) values(?,?,?)",
            [order.oid,order.method, order.note]);
    }
    delOrder(oid){
        return DAO("call proc_del(?)",
            [oid]);
    }
}
module.exports = new DB();
