//引入express
const express = require('express');
//引入连接池模块,文件的上一级是  ../
const pool = require('../pool.js');
//创建路由对象
var router = express.Router();
//添加路由
//1.注册接口
router.post('/reg', function(req, res) {
  var reg = req.body;
  if (!reg.uname) {
    res.send({ code: "3", msg: "用户名为空" }); //3,用户名为空
    return;
  } else {
    var sql2 = "select * from hanfu_user where uname=?"
    pool.query(sql2, [reg.uname], function(err, result) {
      if (err) throw err;
      if (result.length > 0) {
        res.send({ code: "8", msg: "昵称已被占用" })
        return;
      } else {
        if (!reg.upwd) { res.send({ code: "4", msg: "密码为空" }); return; } //4.密码为空
        if (!reg.email) { res.send({ code: "5", msg: "邮箱为空" }); return; } //邮箱为空
        if (!reg.user_name) { res.send({ code: "6", msg: "真实姓名为空" }); return; } //真实姓名为空
        if (!reg.birthday) { res.send({ code: "7", msg: "生日为空" }); return; } //生日为空
        // 根据手机号判断用户唯一性
        if (!reg.phone) {
          res.send({ code: "9", msg: "手机号为空" });
          return; //手机号为空
        } else {
          var sql = "select * from hanfu_user where phone=?"
          pool.query(sql, [reg.phone], function(err, result) {
            if (err) throw err;
            if (result.length > 0) {
              res.send({ code: "2", msg: "手机号注册过" }); //用户注册过
              return;
            } else {
              //把数据插入到数据库
              pool.query('INSERT INTO hanfu_user SET ?', [req.body], function(err, result) {
                if (err) throw err;
                if (result.affectedRows > 0) {
                  res.send({ code: "1", msg: "注册成功" }); //注册成功
                }
              });
            }
          })
        }
      }
    })
  }
});

//2.登录接口
router.post("/login", function(req, res) {
  //声明变量接收获取的数据
  var $uname = req.body.uname;
  var $upwd = req.body.upwd;
  //验证数据是否获取成功
  //console.log($uname,$upwd)
  //判断获取的数据是否为空
  if (!$uname) {
    res.send({ code: "1", msg: "用户名为空" }); //用户名为空
    return;
  }
  if (!$upwd) {
    res.send({ code: "2", msg: "密码为空" }); //密码为空
    return;
  }
  //执行sql语句，验证用户是否存在
  var sql1 = "select uid from hanfu_user where uname=?";
  pool.query(sql1, [$uname], function(err, result) {
    if (err) throw err;
    if (result.length > 0) {
      //执行sql语句，验证用户密码密码是否正确
      var sql2 = "select uid from hanfu_user where uname=? and upwd=?";
      pool.query(sql2, [$uname, $upwd], function(err, result) {
        if (err) throw err;
        if (result.length > 0) {
          console.log(result[0].uid)
          res.send({ code: "3", msg: "登陆成功", uid: `${result[0].uid}` }); //登陆成功
        } else {
          res.send({ code: "4", msg: "密码错误" }); //密码错误
        }
      });
    } else {
      res.send({ code: "5", msg: "该用户不存在" })
    }
  })
});

//3、密码修改
router.post('/forget', function(req, res) {
  var $phone = req.body.phone
  var $upwd = req.body.upwd;
  // 判断用户是否存在
  if (!$phone) { res.send({ code: "3", msg: "手机号为空" }); return; }
  if (!$upwd) { res.send({ code: "4", msg: "密码为空" }); return; }
  var sql = "select * from hanfu_user where phone=?";
  pool.query(sql, [$phone], function(err, result) {
    if (err) throw err;
    // 存在的话修改其密码
    if (result.length > 0) {
      var sql2 = "UPDATE  hanfu_user SET upwd=? WHERE phone=?"
      pool.query(sql2, [$upwd, $phone], function(err, result) {
        if (err) throw err;
        if (result.affectedRows > 0) {
          res.send({ code: "1", msg: "修改成功" }); //修改成功
        }
      });
    } else {
      res.send({ code: "2", msg: "不存在" }) //不存在
    }
  })
})

//4.用户修改
router.post('/update', function(req, res) {
  //验证数据是否为空
  //批量验证 遍历对象中的属性，如果属性值为空，提示属性名这一项是必须的，
  var obj = req.body;
  if (!obj.uname) { res.send({ code: "1", msg: "昵称为空" }); return }
  if (!obj.upwd) { res.send({ code: "2", msg: "密码为空" }); return }
  if (!obj.email) { res.send({ code: "3", msg: "邮箱为空" }); return }
  if (!obj.phone) { res.send({ code: "4", msg: "手机号为空" }); return }
  if (!obj.user_name) { res.send({ code: "5", msg: "真实姓名为空" }); return }
  if (!obj.birthday) { res.send({ code: "6", msg: "生日为空" }); return }
  //执行sql语句，修改编号对应的数据
  pool.query('UPDATE hanfu_user SET uname=?,upwd=?,email=?,phone=?,user_name=?,birthday=? WHERE uname=?', [obj.uname, obj.upwd, obj.email, obj.phone, obj.user_name, obj.birthday, obj.uname_o], function(err, result) {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: '修改成功' });
    } else {
      res.send({ code: 200, msg: '不存在用户' });
    }
  });
});


//5、收货地址
router.post("/address", function(req, res) {
  var addresss = req.body;
  var sql = 'INSERT INTO hanfu_receiver_adderss SET ?'
  if (!addresss.uname) { res.send({ code: "1", msg: "请先登录" }); return }
  if (!addresss.uid) { res.send({ code: "9", msg: "请先登录" }); return }
  if (!addresss.receiver) { res.send({ code: "2", msg: "接收人姓名为空" }); return; };
  if (!addresss.cellphone) { res.send({ code: "3", msg: "接收人手机号为空" }); return; };
  if (!addresss.province) { res.send({ code: "4", msg: "请选择省份" }); return; };
  if (!addresss.city) { res.send({ code: "5", msg: "请选择市区" }); return; };
  if (!addresss.address) { res.send({ code: "7", msg: "请填写具体地址" }); return; };
  if (!addresss.fixedphone) { res.send({ code: "8", msg: "请填写备用电话" }); return; };
  pool.query(sql, [req.body], function(err, result) {
    if (err) throw err;
    res.send({ code: 9, msg: "收货地址添加成功" })
  })
})


// 6、城市
router.get("/city", function(res, res) {
  var sql = "SELECT * FROM cities";
  pool.query(sql, [], function(err, result) {
    if (err) throw err;
    res.send(result)
  })
})

//7 订单详情
router.get('/buy', function(req, res) {
  var sql = 'SELECT * FROM hanfu_receiver_adderss WHERE uname=?'
  pool.query(sql, [req.query.uname], function(err, result) {
    if (err) throw err;
    res.send(result)
  })
})

//4、用户检索
router.get('/detail', function(req, res) {
  //获取数据
  console.log(req.query);
  //验证数据是否为空
  if (!req.query.uname) {
    res.send("不存在该用户");
    return;
  }
  //执行sql语句，查询编号对应的数据
  pool.query('SELECT * FROM hanfu_user WHERE uname=?', [req.query.uname], function(err, result) {
    if (err) throw err;
    console.log(result)
    res.send(result[0]);
  });
});


//5、用户列表
router.get('/list', function(req, res) {
  //获取数据
  //console.log(req.query);
  //res.send('用户列表');
  var pno = req.query.pno; //页码
  var count = req.query.count; //数量
  //如果页码是空的,设置默认值为1
  if (!pno) pno = 1;
  //如果数量为空，设置默认值为1
  if (!count) count = 1;
  //如果不为空，需要把数据转为整型
  pno = parseInt(pno);
  count = parseInt(count);
  var start = (pno - 1) * count;
  //执行sql语句
  pool.query('SELECT * FROM hanfu_user LIMIT ?,?', [start, count], function(err, result) {
    if (err) throw err;
    res.send(result);
  });
});

//7、用户删除
router.get('/delete', function(req, res) {
  //获取数据
  //console.log(req.query);
  //验证数据是否为空
  if (!req.query.uid) {
    res.send({ code: 401, msg: 'uid required' });
    return;
  }
  //执行sql语句
  pool.query('DELETE FROM hanfu_user WHERE uid=?', [req.query.uid], function(err, result) {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: 'delete suc' });
    } else {
      res.send({ code: 301, msg: 'delete err' });
    }
  })
});



//购物车
router.get("/address", function(req, res) {
    var sql = 'SELECT uname FROM hanfu_receiver_adderss WHERE uname=?'
    pool.query(sql, [req.query.uname], function(err, result) {
      if (err) throw err;
      res.send(result)
    })
  })
  //导出路由
module.exports = router;