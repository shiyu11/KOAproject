
const cartDAO=require('../model/cartDAO')
module.exports = {
    getAllcarts: async (ctx, next) => {
        try {
            let allcart = await cartDAO.getAllCart(ctx.params.uid)
            // await ctx.render('review',{data:allreview})
            ctx.body = {"code": 200, "message": "ok", data: allcart}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },


    addCart: async (ctx, next) => {
        // let jsondate= await orderdetailsDAO.getOrder2()
        // console.log(jsondate)
        let carts = {}
        carts.size = ctx.request.body.size
        carts.pid = ctx.request.body.pid
        carts.uid =  ctx.request.body.uid
        carts.pno =  ctx.request.body.pno
        try {
            await cartDAO.addCart(carts)
            ctx.body = {"code": 200, "message": "ok", data: []}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    deletecart:async(ctx,next)=>{
        try {
            //2.调用用户数据访问对象的添加方法
            await cartDAO.deletecart(ctx.params.cid)
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    }
    // addadminreview: async (ctx, next) => {
    //     let jsondate=await reviewDAO.getAllreview(ctx.params.vid)
    //     let adminreview = {}
    //     adminreview.vstate = ctx.request.body.vstate
    //     adminreview.reply = ctx.request.body.reply
    //     try {
    //         await reviewDAO.addadminreview(adminreview)
    //         ctx.body = {"code": 200, "message": "ok", data: []}
    //     }
    //     catch (err) {
    //         ctx.body = {"code": 500, "message": err.toString(), data: []}
    //     }
    // },
    // deletereview:async(ctx,next)=>{
    //     try {
    //         //2.调用用户数据访问对象的添加方法
    //         await reviewDAO.deletereview(ctx.params.vid)
    //         //3.反馈结果
    //         ctx.body = {"code": 200, "message": "ok", data: []}
    //     } catch (err) {
    //         ctx.body = {"code": 500, "message": err.toString(), data: []}
    //     }
    // }
}