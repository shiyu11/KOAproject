const router = require('koa-router')()
const productController = require('../controllers/productController')
const orderController = require('../controllers/orderController');
const orderdetailsController = require('../controllers/orderdetailsController');
const addressController = require('../controllers/addressController');
const reviewController = require('../controllers/reviewController');
const CartController = require('../controllers/cartController');
const collectController = require('../controllers/collectController');


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
})
//实现商品分页
//     .get('/product/:index', async (ctx, next) => {
//         ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
//         await productController.getindexproduct(ctx, next)
//     })


//根据商品编号查找相关的商品信息
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
    .get('/product/reviews/:pid', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        // 获取评论数据
        await reviewController.getAllreview(ctx,next)
    })
    //· 增加用户评论数据(pid)
    .post('/product/adduserreview',async (ctx,next)=> {

        await reviewController.adduserreview(ctx,next)
    })


// router.get('/product/addPictext',async (ctx,next)=>{
//      // 图文上传
//     addDiarys: async (ctx, next) => {
//     var form = new formidable.IncomingForm();
//     form.uploadDir = '../public/diaryImages';   //设置文件存放路径
//     form.multiples = true;  //设置上传多文件
//     form.keepExtensions = true;//保留扩展名
//     form.parse(ctx.req, function (err, fields, files) {
//         console.log(files)
//         console.log(files.dImages)
//         console.log(typeof  files.dImages);
//         //根据files.filename.name获取上传文件名，执行后续写入数据库的操作
//         console.log(fields)
//         // console.log(files.dImages)
//         if (files.dImages==undefined ) {
//             let diarys = {};
//             diarys.dId = fields.dId
//             diarys.arrvialDate = fields.arrvialDate
//             diarys.dContent = fields.dContent
//             diarys.dDate = new Date()
//             diarys.recommend = fields.recommend
//             diarys.uId = fields.uId
//             diarys.hId = fields.hId
//             diarys.dTitle = fields.dTitle
//             // diarys.dImages = ''
//             diarys.dThumbs = fields.dThumbs
//             diarys.oId = fields.oId
//             diarysDAO.addDiarys(diarys);
//
//
//             // }
//             try {
//                 console.log(ok)
//                 ctx.body = {"code": 200, "message": "ok", data: []}
//             } catch (err) {
//                 ctx.body = {"code": 500, "message": err.toString(), data: []}
//             }
//         }
//         else  {
//             var j = files.dImages.length
//             console.log(j)
//             if (j > 1) {
//                 let diarys = {};
//                 diarys.dImages = ''
//                 for (var i = 0; i < j; i++) {
//                     let src = files.dImages[i].path;
//                     let fileName = files.dImages[i].name;
//                     // 获取源文件全路径
//                     let srcNew = path.join(__dirname, files.dImages[i].path);
//                     // 改成你想要的名字
//                     let destName = `${path.basename(fileName, path.extname(fileName))}${path.extname(fileName)}`;
//                     let stt = `http://localhost:3000/diaryImages/${destName}`;
//                     let name = path.join(path.parse(srcNew).dir, destName);
//                     fs.renameSync(srcNew, path.join(path.parse(srcNew).dir, destName));
//                     diarys.dImages = diarys.dImages + stt + ','
//                     console.log( diarys.dImages)
//                 }
//                 diarys.dId = fields.dId
//                 diarys.arrvialDate = fields.arrvialDate
//                 diarys.dContent = fields.dContent
//                 diarys.dDate = new Date()
//                 diarys.recommend = fields.recommend
//                 diarys.uId = fields.uId
//                 diarys.hId = fields.hId
//                 diarys.dTitle = fields.dTitle
//                 diarys.dThumbs = fields.dThumbs
//                 diarys.oId = fields.oId
//                 diarysDAO.addDiarys(diarys);
//                 // }
//                 try {
//                     ctx.body = {"code": 200, "message": "ok", data: []}
//                 } catch (err) {
//                     ctx.body = {"code": 500, "message": err.toString(), data: []}
//                 }
//             }
//             else {
//                 let diarys = {};
//                 let src = files.dImages.path;
//                 let fileName = files.dImages.name;
//                 // 获取源文件全路径
//                 let srcNew = path.join(__dirname, files.dImages.path);
//                 // 改成你想要的名字
//                 let destName = `${path.basename(fileName, path.extname(fileName))}${path.extname(fileName)}`;
//                 let stt = `http://localhost:3000/diaryImages/${destName}`;
//                 let name = path.join(path.parse(srcNew).dir, destName);
//                 fs.renameSync(srcNew, path.join(path.parse(srcNew).dir, destName));
//                 diarys.dImages = stt + ','
//                 diarys.dId = fields.dId
//                 diarys.arrvialDate = fields.arrvialDate
//                 diarys.dContent = fields.dContent
//                 diarys.dDate = new Date()
//                 diarys.recommend = fields.recommend
//                 diarys.uId = fields.uId
//                 diarys.hId = fields.hId
//                 diarys.dTitle = fields.dTitle
//                 // diarys.dImages = stt
//                 diarys.dThumbs = fields.dThumbs
//                 diarys.oId = fields.oId
//                 diarysDAO.addDiarys(diarys);
//                 // }
//                 try {
//                     ctx.body = {"code": 200, "message": "ok", data: []}
//                 } catch (err) {
//                     ctx.body = {"code": 500, "message": err.toString(), data: []}
//                 }
//
//             }
//         }
//
//     })
// },





    //删除商品评价
    .get('/product/deletereview/:vid',async(ctx,next)=>{
        await reviewController.deletereview(ctx,next)
    })

   //添加购物车
    .post('/addcart',async(ctx,next)=>{
       ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await CartController.addCart(ctx,next)
    })
    .get('/getcart/:uid', async (ctx, next) =>{
    ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
    // 获取购物车数据
    await CartController.getAllcarts(ctx,next)
})

    .get('/deletecart/:cid', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await CartController.deletecart(ctx, next)
    })




    //用户添加地址
    .post('/addaddress', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await addressController.addAddress(ctx, next)
    })
    //用户查看全部地址
    .get('/alladdress/:uid',async (ctx, next) =>{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
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
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await orderController.addOrder(ctx, next)
    })
    .post('/orderAdd2',async(ctx,next)=>{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await orderController.addorder2(ctx,next)
    })
    .get('/orderDel/:oid/:aid', async (ctx, next) => {
        await orderController.delOrder(ctx, next)
    })

    //添加购物车
    .post('/addcart',async(ctx,next)=>{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await CartController.addCart(ctx,next)
    })
    .get('/getcart/:uid', async (ctx, next) =>{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        // 获取购物车数据
        await CartController.getAllcarts(ctx,next)
    })

    .get('/deletecart/:cid', async (ctx, next) => {
        await CartController.deletecart(ctx, next)
    })

    //添加收藏
    .post('/addcollection',async(ctx,next)=>{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await collectController.addcollect(ctx,next)
    })
    //获取收藏信息
    .get('/getcollect/:uid', async (ctx, next) =>{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await collectController.getAllcollect(ctx,next)
    })
    //删除收藏信息
    .get('/deletecollect/:pid', async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await collectController.deletecollect(ctx, next)
    })
    //获取判断信息
    .get('/getonly/:uid/:pid', async (ctx, next) =>{
        ctx.set("Access-Control-Allow-Origin","http://localhost:8080")
        await collectController.getonly(ctx,next)
    })


module.exports = router
