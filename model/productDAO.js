var DAO = require('../model/DAO')

class DB {
//获取全部的商品信息（页面场合进行渲染）
    getProduct() {
        return DAO("select * from products ", [])
    }
    getProductdetails(pid) {
        return DAO("select * from products where pid=?", [pid]);
    }
    addProduct(products) {
        return DAO("insert into products values(?,?,?,?,?,?,?,?,?,?,?,?,?)",
            [products.pid, products.pname, products.ppic, products.pprice, products.pnum, products.occasion,
                products.taste, products.theme, products.dpic, products.xpic, products.xxpic, products.text, products.intr]
        );
    }
    deleteProduct(pid) {
        return DAO("call deleteproduct(?)", [pid]);
    }

    // updateProduct(products, pid) {
    //     return DAO("update products set pname=?,ppic=?,pprice=?,pnum=?,occasion=?,taste=?,theme=?,dpic=?,xpic=?,xxpic=?,text=?,intr=? where pid=?",
    //     [products.pname, products.ppic, products.pprice, products.pnum, products.occasion,
    //         products.taste, products.theme, products.dpic, products.xpic, products.xxpic, products.text, products.intr,pid])
    // }
}

module.exports = new DB()