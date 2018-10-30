var orderDAO = require('../model/orderDAO');
module.exports = {
    addOrder: async (ctx, next) => {

        let orderAll = {};
        orderAll.state = ctx.request.body.state;
        orderAll.uid = ctx.request.body.uid;
        orderAll.money = ctx.request.body.money;
        orderAll.aname =ctx.request.body.aname;
        orderAll.phone = ctx.request.body.phone;
        orderAll.address = ctx.request.body.address;
        try {
            //2.调用用户数据访问对象的添加方法
            let jsondata = await orderDAO.addOrder(orderAll);
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data:jsondata}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    addorder2: async (ctx, next) => {
        let orderAll = {};
        orderAll.pid = ctx.request.body.pid;
        orderAll.uid = ctx.request.body.uid;
        orderAll.rnum = ctx.request.body.rnum;
        try {
            //2.调用用户数据访问对象的添加方法
            let jsondata = await orderDAO.addorder2(orderAll);
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data:jsondata}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    //用户获取全部订单详情
    getOrder:async (ctx, next) => {
        try {
            ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
            //2.调用用户数据访问对象的添加方法
            let order = await orderDAO.getOrder (ctx.params.uid);
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: order}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    //用户删除订单
    delectOrder:async (ctx,next)=>{
        try{
            await orderDAO.delectoneOrder(ctx.params.oid)
            ctx.body = {"code":200,"message":"ok",data:[]}
        }
        catch (err) {
            console.log('无法找到当前信息，错误：'+err.message)
        }
    },
    //用户修改订单待收货→待评价状态
    updateOrder1:async (ctx,next)=>{
        try{
            ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
            await orderDAO.updateuserOrder1(ctx.params.oid)
            ctx.body = {"code":200,"message":"ok",data:[]}
        }
        catch (err) {
            console.log('无法找到当前信息，错误：'+err.message)
        }
    },
    //用户修改订单待评价→完成状态
    updateOrder2:async (ctx,next)=>{
        try{
            ctx.set("Access-Control-Allow-Origin","http://10.40.4.15:8080")
            await orderDAO.updateuserOrder2(ctx.params.oid)
            ctx.body = {"code":200,"message":"ok",data:[]}
        }
        catch (err) {
            console.log('无法找到当前信息，错误：'+err.message)
        }
    },


};

