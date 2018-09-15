var DAO=require('../model/DAO')
class DB{
//获取全部的商品信息（页面场合进行渲染）
//     儿童
    getProduct1(){
        return DAO("select * from products where occasion='儿童'",[])
    }
    //聚会
    getProduct2(){
        return DAO("select * from products where occasion='聚会'",[])
    }
   // 生日
    getProduct3(){
        return DAO("select * from products where occasion='生日'",[])
    }
   // 新品
    getProduct4(){
        return DAO("select * from products where occasion='新品'",[])
    }
    getProductdetails(pid){
        return DAO("select * from products where pid=?",[pid]);
    }
}
module.exports=new DB()