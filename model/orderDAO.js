const DAO = require('../model/DAO');
class DB {
    getOrder1() {
        return DAO('select * from `order`', []);
    }

    addOrder(orderAll) {
        return DAO("insert into `order`(state,uid,money,aname,phone,address) value(?,?,?,?,?,?)",
            [orderAll.state,orderAll.uid,orderAll.money,
               orderAll.aname,orderAll.phone,
                orderAll.address]);
    }
    addorder2(orderAll) {
        return DAO("insert into orderdetails(oid,pid,rnum) value ((select Max(order.oid) from `order` where uid=?),?,?) ",
            [orderAll.uid,orderAll.pid,orderAll.rnum]);
    }

    delOrder(oid){
        return DAO("call proc_del(?)",
            [oid]);
    }



    //用户查看所有订单
    getOrder(uid) {
        return DAO('select `order`.* ,orderdetails.pid,orderdetails.rnum,products.pname,products.ppic from `order`,orderdetails,products where `order`.oid = orderdetails.oid and products.pid=orderdetails.pid and order.uid=? order by `order`.oid',
            [uid])
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
        return DAO('update `order` set state=\'待评价\' where oid=? order by `order`.oid DESC',[oid])
    }
    //用户修改订单待评价→完成状态
    updateuserOrder2(oid){
        return DAO('update `order` set state=\'已完成\' where oid=? order by `order`.oid DESC',[oid])
    }

}
module.exports = new DB();
