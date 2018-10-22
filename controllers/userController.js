const userDAO = require('../model/userDAO')

module.exports = {
    getAllUsers: async (ctx, next) => {
        try {
            let jsondata = await userDAO.getUsers();
            ctx.body = {"code": 200, "message": "ok", data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    usersAdd: async (ctx,next) =>{
        //1.收集数据
        let users = { };
        users.uid = ctx.request.body.uid
        users.uname = ctx.request.body.uname;
        users.upwd = ctx.request.body.upwd;
        try{
            //2.调用用户数据访问对象的添加方法
            let data= await  userDAO.addUser(users)
            //3.反馈结果
            ctx.body = {"code":200,"message":"ok",data:[]}
        }catch(err){
            ctx.body = {"code":500,"message":err.toString(),data:[]}
        }
    },
    usersDelete:async (ctx,next)=>{
        try{
            await userDAO.delectUser(ctx.params.uid)
            ctx.body = {"code":200,"message":"ok",data:[]}
        }
        catch (err) {
            console.log('无法找到当前信息，错误：'+err.message)
        }
    }
    ,
    //修改信息
    updateusers:async (ctx,next)=>{
        let users={ };
        users.uid=ctx.request.body.uid;
        users.uname=ctx.request.body.uname;
        users.upwd=ctx.request.body.upwd;
        users.sex=ctx.request.body.sex;
        try {
            let data=await userDAO.updatausers(users);
            ctx.body = {"code": 200, "message": "OK", data:[]}
        } catch (e) {
            ctx.body = {"code": 500, "message": e.toString(), data: []}
        }
    },
}
