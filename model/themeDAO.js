const DAO = require('../model/DAO')

class DB{
    //上传文字信息
    uploadtext(theme){
        return DAO('insert into theme(tid,ttime,tname,tpic) values(?,now(),?,?)',
            [theme.tid,theme.tname,theme.tpic])
    }
    //上传图片信息
    uploadpicture(){
        return DAO()
    }
}
module.exports = new DB();
