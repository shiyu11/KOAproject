var userDAO = require('../model/userDAO')

module.exports = {
    addUser:async (ctx,next) => {
        //1.收集数据
        let users = { };
        users.uid = '5'
        users.uname = '十大叔'
        try{
            //2.调用用户数据访问对象的添加方法
            await userDAO.addUser(users)
            //3.反馈结果
            ctx.body = {"code":200,"message":"ok",data:[]}
        }catch(err){
            ctx.body = {"code":500,"message":err.toString(),data:[]}
        }
    }
}
