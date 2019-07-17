// 引入express模块
const express = require('express');
// 引入连接池模块
const pool = require('../pool.js');
// 创建路由对象
var router = express.Router();
// 添加路由
// 轮播图
router.get('/carousel', (req, res) => {
  var $carousel = req.query.lid
  var sql = "SELECT * FROM  hanfu_index_carousel";
  pool.query(sql, [$carousel], (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 首页商品
router.get('/index', (req, res) => {
    // var $details = req.query.lid;
    // console.log($details)
    var sql = "SELECT * FROM hanfu_index_product";
    pool.query(sql, [], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
  }) //测试能不能用http://127.0.0.1:8080/index或者http://localhost:8080/index

// 商品详情页
router.get('/details', (req, res) => {
  var lid = req.query.lid;
  var output = {
    product: {}, //商品的描述信息
    color: [], //服装颜色的图片
    pics: [], //大图图片列表
    photos: [] //详情页图片
  }
  if (lid !== undefined) {
    var sql = "select * from hanfu_product_list where lid=?;";
    pool.query(sql, [lid], (err, result) => {
      if (err) throw err;
      output.product = result[0]; // 查找到当前的商品详情
      var family_id = output.product["family_id"];
      var sql2 = `select color,lid from hanfu_product_list where family_id=?`
      pool.query(sql2, [family_id], (err, result) => {
        if (err) throw (err);
        output.color = result; //当前商品颜色分类
        // 大图
        var sql3 = `select * from big_img where family_id=?`
        pool.query(sql3, [family_id], (err, result) => {
          if (err) throw err;
          output.pics = result;
          var sql4 = `SELECT * FROM hanfu_product_detail where pid=?`
          pool.query(sql4, [family_id], (err, result) => {
            if (err) throw err;
            output.photos = result;
            res.send(output);
          })
        })
      })
    })
  } else {
    res.send("1");
  }

})

// 商品详情
router.get("/detailsImg", (req, res) => {
  var sql = "SELECT * FROM hanfu_product_detail";
  pool.query(sql, [], (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 搜索功能v
var $term = "汉服"
router.get("/select", (req, res) => {
    var sql = `SELECT * FROM hanfu_product_list WHERE title LIKE ${$term}`;
    pool.query(sql, [], (err, result) => {
      if (err) throw err;

      res.send(result);
    })
  })
  // 导出路由
module.exports = router;