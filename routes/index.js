// 引入express模块
const express=require('express');
// 引入连接池模块
const pool=require('../pool.js');
// 创建路由对象
var router=express.Router();

router.get('/',(req,res)=>{
    var sql="SELECT * FROM hanfu_index_product";
    pool.query(sql,[],(err,result)=>{
         if(err) throw err;
         res.send(result);
    })
})//测试能不能用http://127.0.0.1:8080/index或者http://localhost:8080/index

// 导出路由
module.exports=router;