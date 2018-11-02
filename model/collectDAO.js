var DAO = require('../model/DAO')
class DB {
    //获取全部收藏信息
    getAllcollect(uid) {
        return DAO("select * from (SELECT collect.sid,users.*,products.* FROM collect,users,products where collect.pid=products.pid and users.uid=collect.uid)temp where temp.uid=?", [uid]);
    }
    //添加收藏信息
    addcollect(collect){
        return DAO("insert into collect(pid,uid) values(?,?)",
            [collect.pid,collect.uid]
        );
    }
    //删除收藏信息
    deletecollect(pid){
        return DAO('delete from collect where pid = ?;',[pid])
    }
    //获取唯一信息
    getonly(uid,pid){
        return DAO("select sid from collect where uid=? and pid=?",[uid,pid])
    }

}
module.exports = new DB()