//关于用户对象的相关数据操作
const DAO = require('../model/DAO')

class DB{
    userlogin(uphone){
        return DAO('select * from users where uphone = ?',[uphone]);
    }
    userregister(register) {
        return DAO('insert into users(uphone,upwd,uname) VALUES(?,?,?)',
            [register.uphone,register.upwd, register.uname]);
    }
    // //获取全部用户信息的方法
    // getUsers(){
    //     return DAO('select * from users',[]);
    // }
    // //添加一个用户的信息方法
    // addUser(users){
    //     return DAO('insert into users(uid,uname,upwd) values(?,?,?)',
    //         [users.uid,users.uname,users.upwd])
    // }
    // // //查询指定编号的用户信息方法
    // // getOneUser(uid){
    // //     return DAO('select * from users where uid = ?',[uid])
    // // }
    // //删除指定编号的用户信息方法
    // delectUser(uid){
    //     return DAO('delete from users where uid = ?',[uid])
    // }

    //修改更新个人中心文字部分
    updatausers(users){
        return DAO('update users set uname=?,sex=?,birth=?,email=? where uid=?',
            [users.uname,users.sex,users.birth,users.email,users.uid])
    }
    //获取单个用户信息的方法
    getoneUsers(uid){
        return DAO('select * from users where uid=?',[uid]);
    }
    //用户安全中心修改密码
    updateuserspwd(users){
        return DAO('update users set upwd=? where uid=?',
            [users.upwd,users.uid])
    }
    getallphone(uphone) {
        return DAO('select uphone from users where uphone = ?',[uphone]);
    }
}
module.exports = new DB();
