var DAO=require('../model/DAO')
class DB{
//获取全部的评论相关信息
    getAllreview(){
        return DAO("select review.*,users.uname,users.headpic ,products.pname from review,users,products where users.uid=review.uid and products.pid=review.pid",[])
    }

    //用户增加评论
    addUserreview(userreview,uid,pid){
        return DAO("insert into products (vcontent,vtime)values(?,?) where uid=? and pid=?",
            [ userreview.vcontent, userreview.vtime ,uid,pid]
        );
    }
    // addadminreview(){

}
module.exports=new DB()