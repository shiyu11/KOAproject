const userDAO = require('../model/userDAO')
const crypto=require('crypto')

module.exports = {
    userlogin: async (ctx, next) => {
//用户登录
ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        let query = ctx.request.body;
        let users = {};
        users.uphone = query.uphone;
        let pwd = ctx.request.body.upwd;
        const hash = crypto.createHash('md5');
        hash.update(pwd);
        let pwdMd5 = hash.digest('hex');
        users.upwd =pwdMd5
        // users.upwd = query.upwd;
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
        let pwd = ctx.request.body.upwd;
        const hash = crypto.createHash('md5');
        hash.update(pwd);
        let pwdMd5 = hash.digest('hex');
        register.upwd = pwdMd5;
        register.uname = query.uname;
        try {
            await userDAO.userregister(register);
            ctx.body = {'code': 200, 'message': 'ok', data: register};
        }
        catch (err) {
            ctx.body = {"code": 500, "message": '执行失败', data: []}
        }

        try {
            let query = {};
            let register = {};
            query.userPhone = ctx.request.body.userPhone;
            if (query.userPhone === "") {
                ctx.body = {"code": 500, "message": '用户名为空，请重新输入', data:1}
            }
            else {
                register.userPhone = query.userPhone;
                let pwd = ctx.request.body.userPwd;
                const hash = crypto.createHash('md5');
                hash.update(pwd);
                let pwdMd5 = hash.digest('hex');
                register.userPwd = pwdMd5
                let data = await userReg.login(register)
                if(data.length == 0){
                    ctx.body = {"code": 500, "message": "用户名或密码错误，请重新输入", data:2}
                }
                else {    ctx.body = {"code": 200, "message": "登陆成功", data:data[0]}
                }
            }
        }
        catch (err) {
            ctx.body = {"code": 500, "message": '服务器错误' + err.message, data: 3}
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

    //修改个人中心信息
    updateusers:async (ctx,next)=>{
        let users={ };
        users.uid=ctx.request.body.uid;
        users.uname=ctx.request.body.uname;
        users.sex=ctx.request.body.sex;
        users.birth=ctx.request.body.birth;
        users.email=ctx.request.body.email;
        try {
            let jsondata=await userDAO.updatausers(users);
            ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
            ctx.set('content-type', 'application/json');
            ctx.body = {"code": 200, "message": "OK", data:[]}
        } catch (e) {
            ctx.body = {"code": 500, "message": e.toString(), data: []}
        }
    },
    //用户获取个人信息
    getOneUsers: async (ctx, next) => {
        try {
            let jsondata = await userDAO.getoneUsers(ctx.params.uid);
            ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
            ctx.body = {"code": 200, "message": "ok", data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    //用户安全中心修改密码
    updateuserspwd:async (ctx,next)=>{
        let users={ };
        users.uid=ctx.request.body.uid;
        users.upwd=ctx.request.body.upwd;
        try {
            let data=await userDAO.updateuserspwd(users);
            ctx.body = {"code": 200, "message": "OK", data:[]}
        } catch (e) {
            ctx.body = {"code": 500, "message": e.toString(), data: []}
        }
    },
}
