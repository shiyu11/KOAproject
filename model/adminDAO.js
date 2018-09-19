//关于用户对象的相关数据操作
const DAO = require('../model/DAO')

class DB{
    //获取全部管理员信息的方法
    getadmin(){
        return DAO('select * from admin',[]);
    }
    //添加一个管理员的信息方法
    addadmin(admin){
        return DAO('insert into admin(admin,apwd) values(?,?)',
            [admin.admin,admin.apwd])
    }
    // //查询指定编号的管理员信息方法
    // getOneadmin(gid){
    //     return DAO('select * from admin where gid = ?',[gid])
    // }
    //删除指定编号的管理员的信息方法
    deleteadmin(gid){
        return DAO('delete from admin where gid=?',[gid])
    }
}
module.exports = new DB();
