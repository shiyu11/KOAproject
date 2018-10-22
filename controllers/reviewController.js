const reviewDAO = require('../model/reviewDAO')
const orderdetailsDAO=require('../model/orderdetailsDAO')
module.exports = {
    getAllreview: async (ctx, next) => {
        try {
            let allreview = await reviewDAO.getAllreview()
            // await ctx.render('review',{data:allreview})
            ctx.body = {"code": 200, "message": "ok", data: allreview}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    adduserreview: async (ctx, next) => {
        let jsondate= await orderdetailsDAO.getOrder2(ctx.params.oid)
        console.log(jsondate)
        let userreview = {}
        userreview.vcontent = ctx.request.body.vcontent
        userreview.vtime = ctx.request.body.vtime
        userreview.pid = jsondate[1].pid      //切换pid的值
        userreview.uid = jsondate[0].uid
        try {
            await reviewDAO.addUserreview(userreview)
            ctx.body = {"code": 200, "message": "ok", data: []}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    addadminreview: async (ctx, next) => {
        let jsondate=await reviewDAO.getAllreview(ctx.params.vid)
        let adminreview = {}
        adminreview.vstate = ctx.request.body.vstate
        adminreview.reply = ctx.request.body.reply
        try {
            await reviewDAO.addadminreview(adminreview)
            ctx.body = {"code": 200, "message": "ok", data: []}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    deletereview:async(ctx,next)=>{
        try {
            //2.调用用户数据访问对象的添加方法
            await reviewDAO.deletereview(ctx.params.vid)
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
}
}