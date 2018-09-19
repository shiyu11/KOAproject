//关于用户对象的相关数据操作
const DAO = require('../model/DAO')

class DB{
    //获取全部用户信息的方法
    getUsers(){
        return DAO('select * from users',[]);
    }
    //添加一个用户的信息方法
    addUser(users){
        return DAO('insert into users(uid,uname,upwd) values(?,?,?)',
            [users.uid,users.uname,users.upwd])
    }
    // //查询指定编号的用户信息方法
    // getOneUser(uid){
    //     return DAO('select * from users where uid = ?',[uid])
    // }
    //删除指定编号的用户信息方法
    delectUser(uid){
        return DAO('delete from users where uid = ?',[uid])
    }
}
module.exports = new DB();
