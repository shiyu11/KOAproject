const DAO = require('../model/DAO');
class DB{
    getAddress1() {
        return DAO('select * from `order`,orderdetails,address where order.oid = orderdetails.oid and address.uid = order.uid', []);
    }
    //用户添加新地址
    addAddress(address) {
        return DAO("insert into address(aid,aname,phone,address,defaultaddress,uid) values(?,?,?,?,?,?)",
            [address.aid,address.aname,address.phone,address.address,address.defaultaddress,address.uid]);
    }
    //用户获取全部地址
    getAlladdress(uid){
        return DAO('select * from address where uid=?',uid)
    }
}
module.exports = new DB();
