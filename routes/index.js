const router = require('koa-router')()
const productController = require('../controllers/productController')
const orderController = require('../controllers/orderController');
const orderdetailsController = require('../controllers/orderdetailsController');
const addressController = require('../controllers/addressController');
const reviewController = require('../controllers/reviewController');


// router.post('/',async (ctx,next)=>{
//     //实现跨域允许，第二个参数代表可以跨域请求的源，*代表接受所有不同来源的请求
//     ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
//     //await起到了then的作用，用于处理异步回调方法执行的后续工作
//     await houseController.locationHouse(ctx,next)
//     // await ctx.render('house',{data:jsondata})
// })

//根据商品的调出所有商品的主要信息
router.get('/product', async (ctx, next) => {
    ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
    await productController.allproducts(ctx, next)

})//根据商品编号查找相关的商品信息
    .get('/product/details/:pid', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
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
        await reviewController.getAllreview(ctx,next)
    })
    //· 增加用户评论数据(pid)
    .post('/product/adduserreview/:oid',async (ctx,next)=> {

        await reviewController.adduserreview(ctx,next)
    })

    //增加管理员评论数据!!!
    // .post('/product/addadminreview/:vid',async (ctx,next)=> {
    //     await reviewController.addadminreview(ctx,next)
    //
    // })
    //删除商品评价
    .get('/product/deletereview/:vid',async(ctx,next)=>{
        await reviewController.deletereview(ctx,next)
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
