var orderdetailsDAO = require('../model/orderdetailsDAO');
module.exports = {
    addOrder1: async (ctx, next) => {

        let orderdetails = {};
        orderdetails.rid = ctx.request.body.oid;
        orderdetails.rnum = ctx.request.body.rnum;
        orderdetails.oid = ctx.request.body.note;
        orderdetails.pid = ctx.request.body.note;
        try {
            //2.调用用户数据访问对象的添加方法
            await orderdetailsDAO.addOrder1(orderdetails);
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    }
};