const router = require('koa-router')()
const reviewDAO = require('../model/reviewDAO')
const productController = require('../controllers/productController')
const router = require('koa-router')();
const orderController = require('../controllers/orderController');
const orderdetailsController = require('../controllers/orderdetailsController');
const addressController = require('../controllers/addressController');


//根据商品的调出所有商品的主要信息
router.get('/product', async (ctx, next) => {
    await productController.allproducts(ctx, next)

})//根据商品编号查找相关的商品信息
    .get('/product/details/:pid', async (ctx, next) => {
        await productController.getoneproduct(ctx, next)
    })
    //增加商品信息(文字)
    .post('/product/addproduct', async (ctx, next) => {
        await productController.addproduct(ctx, next)
    })
    //删除商品信息
    .get('/product/deleteproduct/:pid', async (ctx, next) => {
        await productController.deleteproduct(ctx, next)
    })
    //更新商品信息.。。。。
    // .post('/product/updateproduct', async (ctx, next) => {
    //     await productController.updateproduct(ctx,next)
    //
    // })
    //获取评论数据
    .get('/product/reviews', async (ctx, next) => {
        // 获取评论数据
        try {
            let allreview = await reviewDAO.getAllreview()
            // await ctx.render('review',{data:allreview})
            ctx.body = {"code": 200, "message": "ok", data: allreview}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    })
    // .post('/product/adduserreview/:uid/:pid',async (ctx,next)=> {
    //     // 增加用户评论数据
    //     let userreview={}
    //     userreview.vcontent=ctx.request.body.vcontent
    //     userreview.vtime=ctx.request.body.vtime
    //     try {
    //        await reviewDAO.getAllreview(userreview)
    //         ctx.body = {"code": 200, "message": "ok", data: []}
    //     }
    //     catch (err) {
    //         ctx.body = {"code": 500, "message": err.toString(), data: []}
    //     }
    // })

    //相关用户评论数据插入数据（管理员）
    .get('/product/review/admin/:vid', async (ctx, next) => {

    })


    //谭
    .get('/order', async (ctx, next) => {
        await addressController.getAddress1(ctx, next)
    })

    .post('/orderAdd', async (ctx, next) => {
        await orderController.addOrder(ctx, next)
    })

    .post('/orderAdd1', async (ctx, next) => {
        await orderdetailsController.addOrder1(ctx, next)
    })

    .post('/orderAdd2', async (ctx, next) => {
        await addressController.addAddress(ctx, next)
    });

// router.get('/orderDel/:oid',async(ctx,next)=>{
//
//     try{
//         await orderDAO.delOrder(ctx.params.oid);
//         //3.反馈结果
//         ctx.body = {"code":200,"message":"ok",data:[]}
//     }catch(err){
//         ctx.body = {"code":500,"message":err.toString(),data:[]}
//     }
// })



module.exports = router
