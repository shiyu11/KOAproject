const router = require('koa-router')()
const productDAO = require('../model/productDAO')
//根据商品的调出所有商品的主要信息

router.get('/product', async (ctx, next) => {
    // 儿童商品数据
    let productdata1 = await productDAO.getProduct1()
    // 聚会商品数据
    console.log(productdata1)
    let productdata2 =await productDAO.getProduct2()
    // 生日商品数据
    console.log(productdata2)
    let productdata3 =await productDAO.getProduct3()
    // 新品商品数据
    let productdata4 =await productDAO.getProduct4()
    // await ctx.render('products',{data:productdata1,data2:productdata2})

})//根据商品编号查找相关的商品信息
    .get('/product/details/:pid',async (ctx,next)=>{
    let productdetailsdata=await productDAO.getProductdetails(ctx.params.pid)
    console.log(productdetailsdata)
        //相关的评论
    // await ctx.render('productdetails',{data:productdetailsdata[0]})
})



module.exports = router
