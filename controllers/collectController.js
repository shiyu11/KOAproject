const collectDAO=require('../model/collectDAO')
module.exports = {
    getAllcollect: async (ctx, next) => {
        try {
            let allcollect = await collectDAO.getAllcollect(ctx.params.uid)
            ctx.body = {"code": 200, "message": "ok", data: allcollect}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    getonly: async (ctx, next) => {
        try {
            let only = await collectDAO.getonly(ctx.params.uid,ctx.params.pid)
            ctx.body = {"code": 200, "message": "ok", data: only}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    addcollect: async (ctx, next) => {
        let collect = {}
        collect.pid = ctx.request.body.pid
        collect.uid =  ctx.request.body.uid
        try {
            await collectDAO.addcollect(collect)
            ctx.body = {"code": 200, "message": "ok", data: []}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    deletecollect:async(ctx,next)=>{
        try {
            //2.调用用户数据访问对象的添加方法
            await collectDAO.deletecollect(ctx.params.pid)
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    }
}