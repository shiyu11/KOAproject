const router = require('koa-router')()
const productController = require('../controllers/productController')
const orderController = require('../controllers/orderController');
const orderdetailsController = require('../controllers/orderdetailsController');
const addressController = require('../controllers/addressController');
const reviewController = require('../controllers/reviewController');
const CartController = require('../controllers/cartController');


// router.post('/',async (ctx,next)=>{
//     //实现跨域允许，第二个参数代表可以跨域请求的源，*代表接受所有不同来源的请求
//     ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
//     //await起到了then的作用，用于处理异步回调方法执行的后续工作
//     await houseController.locationHouse(ctx,next)
//     // await ctx.render('house',{data:jsondata})
// })

//根据商品的调出所有商品的主要信息
router.get('/product', async (ctx, next) => {
    ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
    await productController.allproducts(ctx, next)
})
//实现商品分页
//     .get('/product/:index', async (ctx, next) => {
//         ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
//         await productController.getindexproduct(ctx, next)
//     })


//根据商品编号查找相关的商品信息
    .get('/product/details/:pid', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
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
    .get('/product/reviews/:pid', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        // 获取评论数据
        await reviewController.getAllreview(ctx,next)
    })
    //· 增加用户评论数据(pid)
    .post('/product/adduserreview',async (ctx,next)=> {

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

   //添加购物车
    .post('/addcart',async(ctx,next)=>{
       ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        await CartController.addCart(ctx,next)
    })
    .get('/getcart/:uid', async (ctx, next) =>{
    ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
    // 获取购物车数据
    await CartController.getAllcarts(ctx,next)
})

    .get('/deletecart/:cid', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        await CartController.deletecart(ctx, next)
    })




    //用户添加地址
    .post('/addaddress', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        await addressController.addAddress(ctx, next)
    })
    //用户查看全部地址
    .get('/alladdress/:uid',async (ctx, next) =>{
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        await addressController.getAlladdress(ctx, next)
    })

    // //用户查询订单
    //     .get('/getorderdetails',async (ctx, next) =>{
    //         await orderdetailsController.getOrder(ctx,next)
    //     })
    //用户修改订单待收货→待评价状态
    .get('/updateor1/:oid',async (ctx, next) =>{
        await orderController.updateOrder1(ctx,next)
    })
    //用户修改订单待评价→完成状态
    .get('/updateor2/:oid',async (ctx, next) =>{
        await orderController.updateOrder2(ctx,next)
    })
    //用户查看所有订单
    .get('/allorder/:uid', async (ctx, next) => {
        await orderController.getOrder(ctx, next)
    })
    //用户删除订单
    .get('/orderdelete/:oid',async (ctx,next)=>{
        await orderController.delectOrder(ctx,next)
    })
    // //· 增加用户评论数据(pid)
    // .post('/product/adduserreview',async (ctx,next)=> {
    //     await reviewController.adduserreview(ctx,next)
    // })
    // //· 增加用户评论数据(pid)
    // .post('/product/adduserreview',async (ctx,next)=> {
    //     await reviewController.adduserreview(ctx,next)
    // })



    //谭
    .get('/order', async (ctx, next) => {
        await orderController.getOrder(ctx, next)
    })

    .post('/orderAdd1', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        await orderController.addOrder(ctx, next)
    })
    .post('/orderAdd2',async(ctx,next)=>{
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        await orderController.addorder2(ctx,next)
    })
    .get('/orderDel/:oid/:aid', async (ctx, next) => {
        await orderController.delOrder(ctx, next)
    })

    //添加购物车
    .post('/addcart',async(ctx,next)=>{
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        await CartController.addCart(ctx,next)
    })
    .get('/getcart/:uid', async (ctx, next) =>{
        ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
        // 获取购物车数据
        await CartController.getAllcarts(ctx,next)
    })

    .get('/deletecart/:cid', async (ctx, next) => {
        await CartController.deletecart(ctx, next)
    })

module.exports = router
