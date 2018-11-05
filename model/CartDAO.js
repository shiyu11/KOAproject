var DAO = require('../model/DAO')

class DB {
//获取全部的购物车信息（页面场合进行渲染）
    getAllCart(uid) {
        return DAO("select * from (SELECT cart.cid,cart.size,cart.pno,users.*,products.* FROM cart,users,products where cart.pid=products.pid and users.uid=cart.uid)temp where temp.uid=? order by temp.cid DESC", [uid]);
    }
// 添加购物车信息
    addCart(cart) {
        return DAO("insert into cart(size,pid,uid,pno) values(?,?,?,?)",
            [cart.size,cart.pid,cart.uid,cart.pno]
        );
    }

    deletecart(cid){
        return DAO('delete from cart where cid = ?;',[cid])
    }
}

module.exports = new DB()