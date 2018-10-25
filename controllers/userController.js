const userDAO = require('../model/userDAO')

module.exports = {
    userlogin: async (ctx, next) => {
//用户登录
ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        let query = ctx.request.body;
        let users = {};
        users.uphone = query.uphone;
        users.upwd = query.upwd;
        try {
            //获取传回的手机号和密码
            let jsondata = await userDAO.userlogin(users.uphone);
            console.log(jsondata);
            if (jsondata.length == 0) {
                ctx.body = {
                    code: 500,
                    message: '用户不存在'
                }
            } else if (jsondata[0].upwd == users.upwd) {
                ctx.body = {"code": 200, "message": "登录成功！", data: jsondata[0]}
                //用户登录成功，将信息保存在cookie中
                ctx.cookies.set('user', jsondata[0])

            } else {
                ctx.body = {"code": 403, "message": '用户不存在或密码错误', data: []}
            }
        }
        catch
            (err)
        {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },

    userregister: async (ctx,next) => {
        let query = ctx.request.body;
        let register = {};
        register.uphone = query.uphone;
        register.upwd = query.upwd;
        register.uname = query.uname;
        try {
            await userDAO.userregister(register);
            ctx.body = {'code': 200, 'message': 'ok', data: register};
        }
        catch (err) {
            ctx.body = {"code": 500, "message": '执行失败', data: []}
        }
    },


//     getAllUsers: async (ctx, next) => {
//         try {
//             let jsondata = await userDAO.getUsers();
//             ctx.body = {"code": 200, "message": "ok", data: jsondata}
//         }
//         catch (err) {
//             ctx.body = {"code": 500, "message": err.toString(), data: []}
//         }
//     },
//     usersAdd: async (ctx,next) =>{
//         //1.收集数据
//         let users = { };
//         users.uid = ctx.request.body.uid
//         users.uname = ctx.request.body.uname;
//         users.upwd = ctx.request.body.upwd;
//         try{
//             //2.调用用户数据访问对象的添加方法
//             let data= await  userDAO.addUser(users)
//             //3.反馈结果
//             ctx.body = {"code":200,"message":"ok",data:[]}
//         }catch(err){
//             ctx.body = {"code":500,"message":err.toString(),data:[]}
//         }
//     },
//     usersDelete:async (ctx,next)=>{
//         try{
//             await userDAO.delectUser(ctx.params.uid)
//             ctx.body = {"code":200,"message":"ok",data:[]}
//         }
//         catch (err) {
//             console.log('无法找到当前信息，错误：'+err.message)
//         }
//     }
}
