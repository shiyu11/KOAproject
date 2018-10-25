var DAO=require('../model/DAO')
class DB{
//获取全部的评论相关信息
    getAllreview(pid){
        return DAO("select * from (select review.*,users.uname,users.headpic ,products.pname from review,users,products where users.uid=review.uid and products.pid=review.pid)temp where temp.pid=?",[pid])
    }

    //用户增加评论（pid）
    addUserreview(userreview){
        return DAO("insert into review (vcontent,vtime,pid,uid)values(?,?,?,?)",
            [userreview.vcontent, userreview.vtime ,userreview.pid,userreview.uid]
        );
    }
    //管理员增加评论!!
    addadminreview(adminreview){
        return DAO("insert into review (vstate,reply)values(?,?)",
            [ adminreview.vstate, adminreview.reply]
        );
    }
//删除某条信息
    deletereview(vid){
        return DAO('delete from review where vid = ?;',[vid])
    }
}
module.exports=new DB()