
const router = require('koa-router')()
const adminController=require('../controllers/adminController')
const userController=require('../controllers/userController')
const userDAO=require('../model/userDAO')
router.prefix('/users')

router.post('/adminlogin', async(ctx,next) => {
    await adminController.login(ctx,next)
})
//user根路由
    .get('/',async (ctx,next)=>{
        // //await起到了then的作用，用于处理异步回调方法执行的后续工作
        await adminController.getAllAdmin(ctx,next)
    })
    .post('/adminadd',async (ctx,next)=>{
        await adminController.addadmin(ctx,next)

    })
    // router.get('/adminfind/:gid',async (ctx,next)=>{
    //     // let admin = { };
    //     // admin.admin=ctx.request.body.admin;
    //     // admin.apwd=ctx.request.body.apwd;
    //     await adminController.getOneadmin(ctx,next)
    // })
    .get('/admindelete/:gid',async (ctx,next)=>{
        await adminController.deleteadmin(ctx,next)
    })
    // router.post('/gain',async (ctx,next)=>{
    //     await userController.gainusers(ctx,next)
    .post('/usersupdata',async (ctx,next)=>{
        await userController.updateusers(ctx,next)
    })
// router.post('/usersuploadfile',async (ctx,next)=>{
//     await userController.gainheadpic(ctx,next)
// })


router.get('/getAllUser',async (ctx,next)=>{
    await userController.getAllUsers(ctx,next)
})
router.post('/usersAdd',async (ctx,next)=>{
    await userController.usersAdd(ctx,next)

})
// router.get('/find/:uid',async (ctx,next)=>{
//     try{
//         let jsondata = await userDAO.getOneUser(ctx.params.uid)
//         console.log(jsondata)
//         // ctx.set('content-type','application/json')
//         // ctx.body = jsondata;
//     }
//     catch (err) {
//        console.log('无法找到当前信息，错误：'+err.message)
//     }
// })
router.get('/usersdelect/:uid',async (ctx,next)=>{
    await userController.usersDelete(ctx.next)
})


router.post('/login',async (ctx,next)=>{
    await userController.userlogin(ctx,next)
})

//用户注册
router.post('/register',async (ctx,next)=>{
    ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
    await userController.userregister(ctx,next);
})
// 用户注册最终


//用户修改个人中心
    .post('/updateusers', async (ctx, next) => {
        await userController.updateusers(ctx,next)
    })
    //获取单个用户信息
    .get('/getOneUsers/:uid',async (ctx,next)=>{
        await userController.getOneUsers(ctx,next)
    })
    //用户安全中心修改密码
    .post('/updateuserspwd/:uid', async (ctx, next) => {
        await userController.updateuserspwd(ctx,next)
    })






//匹配所有的手机号
router.get('/getallphone/:uphone',async (ctx,next)=>{

    try{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        let jsondata = await userDAO.getallphone(ctx.params.uphone);
        console.log(jsondata)
        ctx.body = {"code":200,"message":"ok",data:jsondata}
    }catch (err) {
        ctx.body = {"code":500,"message":err.toString(),data:[]}
    }
})


module.exports = router
