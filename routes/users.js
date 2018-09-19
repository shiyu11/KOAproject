const router = require('koa-router')()
const userDAO = require('../model/userDAO')
const themeDAO = require('../model/themeDAO')
const userCtroller = require('../controllers/userController')
router.prefix('/users')
//user根路由
router.get('/',async (ctx,next)=>{
    let jsondata = await userDAO.getUsers();
    console.log(jsondata)
})
router.post('/Add',async (ctx,next)=>{
    //1.收集数据
    let users = { };
    // users.uid = ctx.request.body.uid
    users.uname = ctx.request.body.uname;
    users.upwd = ctx.request.body.upwd;
    // users.uname = '十大叔'
    // users.upwd='6666'
    try{
            //2.调用用户数据访问对象的添加方法
            let data= await  userDAO.addUser(users)
            console.log(data)
            //3.反馈结果
             ctx.body = {"code":200,"message":"ok",data:[]}
            // ctx.set('content-type','application/json')
            // ctx.body = jsondata;
    }catch(err){
        ctx.body = {"code":500,"message":err.toString(),data:[]}
    }
})
router.get('/find/:uid',async (ctx,next)=>{
    try{
        let jsondata = await userDAO.getOneUser(ctx.params.uid)
        console.log(jsondata)
        // ctx.set('content-type','application/json')
        // ctx.body = jsondata;
    }
    catch (err) {
       console.log('无法找到当前信息，错误：'+err.message)
    }
})
router.get('/delect/:uid',async (ctx,next)=>{
    try{
        let jsondata = await userDAO.delectUser(ctx.params.uid)
        console.log(jsondata)
    }
    catch (err) {
        console.log('无法找到当前信息，错误：'+err.message)
    }
})
//主题界面上传文字信息路由
router.post('/uploadtext',async (ctx,next)=>{
    //1.收集数据
    let theme = { };
    theme.tid = ctx.request.body.tid
    theme.tname = ctx.request.body.tname
    theme.tpic = ctx.request.body.tpic
    try{
        //2.调用用户数据访问对象的添加方法
        await themeDAO.uploadtext(theme)
        //3.反馈结果
        ctx.body = {"code":200,"message":"ok",data:theme}
    }catch(err){
        ctx.body = {"code":500,"message":err.toString(),data:[]}
    }
})

module.exports = router
