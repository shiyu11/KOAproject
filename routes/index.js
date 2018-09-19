const router = require('koa-router')();
const eventDAO = require('../model/eventDAO');
const eventdetailsDAO = require('../model/eventdetailsDAO');
const orderDAO = require('../model/orderDAO');
const orderdetailsDAO = require('../model/orderdetailsDAO');
const addressDAO = require('../model/addressDAO');
const orderController = require('../controllers/orderController');
const orderdetailsController = require('../controllers/orderdetailsController');
const addressController = require('../controllers/addressController');

router.get('/order',async(ctx,next)=>{
    let orderdata1 = await orderDAO.getOrder1();
    let orderdata2 = await orderdetailsDAO.getOrder2();
    let address1 = await addressDAO.getAddress1();
    console.log(address1);
    await ctx.render('order',{title:'提交订单',data:address1})
    // ctx.body = {"code":200,"message":"ok","data":address1};
});

router.post('/Add',async(ctx,next)=> {
    await orderController.addOrder(ctx,next)
});

router.post('/Add1',async(ctx,next)=> {
    await orderdetailsController.addOrder1(ctx,next)
});

router.post('/Add2',async(ctx,next)=> {
    await addressController.addAddress(ctx,next)
});

router.get('/Del/:oid',async(ctx,next)=>{

    try{
        await orderDAO.delOrder(ctx.params.oid);
        //3.反馈结果
        ctx.body = {"code":200,"message":"ok",data:[]}
    }catch(err){
        ctx.body = {"code":500,"message":err.toString(),data:[]}
    }
})
module.exports = router;
