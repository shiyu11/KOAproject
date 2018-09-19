const adminDAO=require('../model/adminDAO')

module.exports ={
    // login:async (ctx,next)=>{
    //     // const query1=ctx.request.query1;
    //     let query = ctx.request.body;
    //     console.log(query);
    //     try{
    //         ctx.body = {"code":200,"message":"ok",data:query}
    //
    //     }catch (err) {
    //         ctx.body = {"code":500,"message":err.toString(),data:[]}
    //     }
    // },
    getAllAdmin:async (ctx,next)=>{
        let admins = await adminDAO.getadmin()
        try{
            ctx.body = {"code":200,"message":"ok",data:admins}
        }catch (err) {
            ctx.body = {"code":500,"message":err.toString(),data:[]}
        }
    },
    addadmin:async (ctx,next)=>{
        let admin = { };
        admin.admin=ctx.request.body.admin;
        admin.apwd=ctx.request.body.apwd;
        try{
            //2.调用用户数据访问对象的添加方法
            await adminDAO.addadmin(admin)
            //3.反馈结果
            ctx.body = {"code":200,"message":"ok",data:[]}
        }catch(err){
            ctx.body = {"code":500,"message":err.toString(),data:[]}
        }
},
    getOneadmin:async (ctx,next)=>{
        let jsondata = await adminDAO.getOneadmin(ctx.params.gid)
        try{
            console.log(jsondata)
            ctx.body = {"code":200,"message":"ok",data:jsondata}
        }
        catch (err) {
            ctx.body = {"code":500,"message":err.toString(),data:[]}
            console.log('无法找到当前信息，错误：'+e.message)
        }
    },
    deleteadmin:async(ctx,next)=>{
        let jsondata = await adminDAO.deleteadmin(ctx.params.gid)
        try{
            console.log(jsondata)
            ctx.body = {"code":200,"message":"ok",data:["删除成功"]}
        }
        catch (err) {
            ctx.body = {"code":500,"message":err.toString(),data:[]}
            console.log('无法找到当前信息，错误：'+err.message)
        }
    },
}

