const productDAO = require('../model/productDAO')
module.exports = {
    allproducts: async (ctx, next) => {
        try {
            // 商品数据
            let productdata = await productDAO.getProduct()
            // await ctx.render('products', {data: productdata})
            ctx.body={"code":200,"message":"ok",data:productdata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    getoneproduct: async (ctx, next) => {
        let productdetailsdata = await productDAO.getProductdetails(ctx.params.pid)
        try {
            // await ctx.render('productdetails', {data: productdetailsdata[0]})
            ctx.body={"code":200,"message":"ok",data:productdetailsdata[0]}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    addproduct: async (ctx, next) => {
        //1.收集数据
        let products = {};
        products.pid = ctx.request.body.pid
        products.pname = ctx.request.body.pname
        products.ppic = ctx.request.body.ppic
        products.pprice = ctx.request.body.pprice
        products.pnum = ctx.request.body.pnum
        products.occasion = ctx.request.body.occasion
        products.taste = ctx.request.body.taste
        products.theme = ctx.request.body.theme
        products.dpic = ctx.request.body.dpic
        products.xpic = ctx.request.body.xpic
        products.xxpic = ctx.request.body.xxpic
        products.text = ctx.request.body.text
        products.intr = ctx.request.body.intr
        try {
            //     //2.调用用户数据访问对象的添加方法
            await productDAO.addProduct(products)
            //     //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    deleteproduct: async (ctx, next) => {
        try {
            //2.调用用户数据访问对象的添加方法
            await productDAO.deleteProduct(ctx.params.pid)
            //     //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    // updateproduct:async(ctx,next)=>{
    //     let products = {};
    //     products.pname = ctx.request.body.pname
    //     products.ppic = ctx.request.body.ppic
    //     products.pprice = ctx.request.body.pprice
    //     products.pnum = ctx.request.body.pnum
    //     products.occasion = ctx.request.body.occasion
    //     products.taste = ctx.request.body.taste
    //     products.theme = ctx.request.body.theme
    //     products.dpic = ctx.request.body.dpic
    //     products.xpic = ctx.request.body.xpic
    //     products.xxpic = ctx.request.body.xxpic
    //     products.text = ctx.request.body.text
    //     products.intr = ctx.request.body.intr
    //     try {
    //         // 2.调用用户数据访问对象的添加方法
    //         await productDAO.updateProduct(products,ctx.params.pid)
    //         // 3.反馈结果
    //         ctx.body = {"code": 200, "message": "ok", data: []}
    //     } catch (err) {
    //         ctx.body = {"code": 500, "message": err.toString(), data: []}
    //     }
    // }


}