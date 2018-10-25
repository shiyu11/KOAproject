const DAO = require('../model/DAO');
class DB {
    getOrder1() {
        return DAO('select * from `order`', []);
    }

    addOrder(orderAll) {
        return DAO("call proc_add(?,?,?,?,?,?,?,?,?,?)",
            [orderAll.state,orderAll.uid,orderAll.money,
                orderAll.rnum,orderAll.oid,orderAll.pid,orderAll.aname,orderAll.phone,
                orderAll.address,orderAll.defaultaddress]);
    }
    delOrder(oid){
        return DAO("call proc_del(?)",
            [oid]);
    }
    //用户查看所有订单
    getOrder(){
        return DAO('select * from `order`,orderdetails,address,products where order.oid = orderdetails.oid and address.uid = order.uid and products.pid=orderdetails.pid')
    }
    // getOrder() {
    //     return DAO('select * from `order`,orderdetails,address where order.oid = orderdetails.oid and address.uid = order.uid', []);
    // }
    //用户删除订单
    delectoneOrder(oid){
        return DAO('delete from order where oid = ?',[oid])
    }
    //用户修改订单待收货→待评价状态
    updateuserOrder1(oid){
        return DAO('update `order` set state=\'待评价\' where oid=?',[oid])
    }
    //用户修改订单待评价→完成状态
    updateuserOrder2(oid){
        return DAO('update `order` set state=\'已完成\' where oid=?',[oid])
    }

}
module.exports = new DB();
