var addressDAO = require('../model/addressDAO');
module.exports = {
    getAddress1:async (ctx, next) => {

        try {
            //2.调用用户数据访问对象的添加方法
            let address1 = await addressDAO.getAddress1 ();
            //3.反馈结果
            ctx.body = {"code": 200, "message": "ok", data: address1}
        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },

    addAddress: async (ctx, next) => {
        let address = {};
        address.aid =ctx.request.body.aid;
        address.aname =ctx.request.body.aname;
        address.phone = ctx.request.body.phone;
        address.address = ctx.request.body.address;
        address.defaultaddress = ctx.request.body.defaultaddress;
        try{
            //2.调用用户数据访问对象的添加方法
            await addressDAO.addAddress(address);
            //3.反馈结果
            ctx.body = {"code":200,"message":"ok",data:[]}
        }catch(err){
            ctx.body = {"code":500,"message":err.toString(),data:[]}
        }
    }
};
