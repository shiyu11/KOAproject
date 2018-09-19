var orderDAO = require('../model/orderDAO');
module.exports = {
    addOrder: async (ctx, next) => {

        let order = {};
        order.oid = ctx.request.body.oid;
        order.method = ctx.request.body.method;
        order.note = ctx.request.body.note;
        try {
            //2.调用用户数据访问对象的添加方法
            await orderDAO.addOrder(order);
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    }
};

