-- #设置连接方式
SET NAMES UTF8;

-- #创建数据库hanfu
DROP DATABASE IF EXISTS hanfu;
CREATE DATABASE hanfu CHARSET=UTF8;
-- #进入数据库
USE hanfu;

-- #创建用户信息表hanfu_user
CREATE TABLE hanfu_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,--#用户的ID
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone CHAR(11),
  avatar VARCHAR(128),        --#头像图片路径
  user_name VARCHAR(32),      --#用户的真实姓名
  gender  TINYINT,            --#性别0-> 女，1->男
  birthday DATETIME
);

-- #往用户信息表中插入数据
INSERT INTO hanfu_user VALUES("1","heart","123456","1632867834@qq.com","13839494671","","吴一杰","0","1997-03-25");
INSERT INTO hanfu_user VALUES("","littleluck","123457","123457@qq.com","12345678912","","叮叮","1","1993-10-03");
INSERT INTO hanfu_user VALUES("","Devotion","123458","123458@qq.com","12345678913","","当当","1","1998-10-03");
INSERT INTO hanfu_user VALUES("","Krismile","123459","123459@qq.com","12345678914","","梅梅","0","2000-11-16");
INSERT INTO hanfu_user VALUES("","Alice","123450","123450@qq.com","12345678915","","喜妹","0","1997-03-05");
INSERT INTO hanfu_user VALUES("","Amanda","123467","123467@qq.com","12345678921","","文肖","1","1993-10-03");
INSERT INTO hanfu_user VALUES("","Constance","123468","123468@qq.com","12345678931","","文凯","1","2002-01-05");
INSERT INTO hanfu_user VALUES("","Debby","123469","123469@qq.com","12345678941","","吴凯","1","1997-04-25");
INSERT INTO hanfu_user VALUES("","Edwina","123460","123460@qq.com","12345678951","","芬芬","0","1994-02-23");
INSERT INTO hanfu_user VALUES("","Elsa","123478","123478@qq.com","12345678961","","笑笑","0","2002-3-24");
INSERT INTO hanfu_user VALUES("","Hulda","123479","123479@qq.com","12345678971","","璐璐","0","2000-6-09");
INSERT INTO hanfu_user VALUES("","Julie","123470","123470@qq.com","12345678981","","杰克","1","1993-03-35");
INSERT INTO hanfu_user VALUES("","Kama","123489","123489@qq.com","12345678991","","曼曼","0","2000-6-09");
INSERT INTO hanfu_user VALUES("","Jocelyn","123480","123480@qq.com","12345678922","","约翰","1","1993-03-35");
INSERT INTO hanfu_user VALUES("","Kay","123490","123490@qq.com","12345678932","","凯特","1","1997-04-25");
INSERT INTO hanfu_user VALUES("","Jodie","123345","123345@qq.com","12345678942","","戴娜","0","2002-3-24");
INSERT INTO hanfu_user VALUES("","Laura","123356","123356@qq.com","12345678952","","劳拉","0","2000-11-16");

-- #创建用户地址表hanfu_receiver_address
CREATE TABLE hanfu_receiver_adderss(
  aid INT PRIMARY KEY AUTO_INCREMENT, --#地址编号
  user_id INT,                --#用户编号
  receiver VARCHAR(16),       --#接收人姓名
  province  VARCHAR(16),      --#省
  city  VARCHAR(16),          --#市
  county VARCHAR(16),         --#县
  address VARCHAR(128),       --#详细地址
  cellphone VARCHAR(16),      --#手机
  fixedphone VARCHAR(16),     --#固定电话
  postcode CHAR(6),           --#邮编
  tag  VARCHAR(16),           --#标签名
  is_default BOOL             --#是否为当前用户的默认收货地址
);

-- #创建用户购物车表hanfu_shopping_cart
CREATE TABLE hanfu_shopping_cart(
 cid INT PRIMARY KEY AUTO_INCREMENT, 
 user_id INT,                    --#用户编号
 product_id INT,                 --#商品编号
 count INT                       --#数量
);

-- #创建用户订单表hanfu_order
CREATE TABLE hanfu_order(
 aid INT PRIMARY KEY AUTO_INCREMENT,  #地址编号
 user_id INT,                    #用户编号
 address INT,
 status INT,                     --#订单状态
 order_time BIGINT,              --#下单时间
 pay_time BIGINT,                --#付款时间
 deliver_time BIGINT,            --#发货时间
 received_time BIGINT            --#收货时间
);

#创建用户订单详情表hanfu_order_detail
CREATE TABLE hanfu_order_detail(
 did INT PRIMARY KEY AUTO_INCREMENT,
 order_id INT,                  --#订单编号
 product_id INT,                --#产品编号
 count INT                      --#购买数量
);

#创建商品表 hanfu_product_list
CREATE TABLE hanfu_product_list(
 lid INT PRIMARY KEY AUTO_INCREMENT,  --#商品编号
 family_id INT,                       --#所属家族编号,
 product_id BIGINT,                   --#产品编号
 title VARCHAR(128),                  --#主标题
 mumber_price DECIMAL(5,2),           --#会员价
 notmumber_price DECIMAL(5,2),        --#正常价
 color  varchar(128),                 --#服装颜色
 size  varchar(5),                    --#服装大小
 shelf_time  BIGINT,                  --#上架时间
 sold_count  INT,                     --#出售数量
 is_online   BOOL                  --#是否在售 0->否 1->是
);

-- #往商品列表中插入数据
-- #女装，同意一颜色不同型号就是不同商品
-- #1号商品，有三个颜色，五种型号,粉色
INSERT INTO hanfu_product_list VALUES("1","10","101","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_4.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","102","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_4.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","103","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_4.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","104","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_4.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","105","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_4.jpg","XL","2019-3-25","2019","1");

-- #浅蓝
INSERT INTO hanfu_product_list VALUES("","10","106","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_5.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","107","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_5.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","108","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_5.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","109","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_5.jpg","X","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","110","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_5.jpg","XL","2019-3-25","2019","1");


-- #深蓝
INSERT INTO hanfu_product_list VALUES("","10","111","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","112","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","113","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","114","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","X","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","115","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","XL","2019-3-25","2019","1");


--#天蓝
INSERT INTO hanfu_product_list VALUES("","10","116","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","117","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","118","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","119","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","X","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","120","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","XL","2019-3-25","2019","1");

-- #2号商品,一个颜色
INSERT INTO hanfu_product_list VALUES("","10","121","梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙","288","298","../img/girl2_14.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","122","梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙","288","298","../img/girl2_14.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","123","梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙","288","298","../img/girl2_14.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","124","梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙","288","298","../img/girl2_14.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","125","梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙","288","298","../img/girl2_14.jpg","XL","2019-3-25","2019","1");


-- #3号商品，两个颜色
-- #粉色
INSERT INTO hanfu_product_list VALUES("","10","126","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_1.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","127","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","128","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","129","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_1.jpg","X","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","130","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/gir3_1.jpg","XL","2019-3-25","2019","1");

-- #浅蓝色
INSERT INTO hanfu_product_list VALUES("","10","131","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_3.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","132","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","133","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","134","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_3.jpg","X","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","135","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_3.jpg","XL","2019-3-25","2019","1");


-- #四号商品，两个颜色，粉色和深蓝
-- #粉色
INSERT INTO hanfu_product_list VALUES("","10","136","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_1.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","137","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_1.jpg","S","2019-3-25","2019","1");;
INSERT INTO hanfu_product_list VALUES("","10","138","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","139","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","140","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_1.jpg","XL","2019-3-25","2019","1");


-- #蓝色
INSERT INTO hanfu_product_list VALUES("","10","141","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_2.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","142","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_2.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","143","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_2.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","144","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_2.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","145","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_2.jpg","XL","2019-3-25","2019","1");

-- #5号商品，两个颜色
-- #浅蓝
INSERT INTO hanfu_product_list VALUES("","10","146","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_2.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","147","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_2.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","148","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_2.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","149","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_2.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","150","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_2.jpg","XL","2019-3-25","2019","1");

-- #粉色
INSERT INTO hanfu_product_list VALUES("","10","151","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_3.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","152","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","153","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","154","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","155","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_3.jpg","XL","2019-3-25","2019","1");

-- #6号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","10","156","初姗古装女仙女汉服超仙改良襦裙广袖流仙裙中国风清新淡雅演出服","396","388","../img/girl9_4.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","157","初姗古装女仙女汉服超仙改良襦裙广袖流仙裙中国风清新淡雅演出服","396","388","../img/girl9_4.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","158","初姗古装女仙女汉服超仙改良襦裙广袖流仙裙中国风清新淡雅演出服","396","388","../img/girl9_4.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","159","初姗古装女仙女汉服超仙改良襦裙广袖流仙裙中国风清新淡雅演出服","396","388","../img/girl9_4.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","160","初姗古装女仙女汉服超仙改良襦裙广袖流仙裙中国风清新淡雅演出服","396","388","../img/girl9_4.jpg","XL","2019-3-25","2019","1");

-- #7号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","10","161","BOBO Angel原创改良锦鲤古装古风汉服春夏装女中国风襦裙汉元素套装","329","298","../img/girl10_4.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","162","BOBO Angel原创改良锦鲤古装古风汉服春夏装女中国风襦裙汉元素套装","329","298","../img/girl10_4.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","163","BOBO Angel原创改良锦鲤古装古风汉服春夏装女中国风襦裙汉元素套装","329","298","../img/girl10_4.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","164","BOBO Angel原创改良锦鲤古装古风汉服春夏装女中国风襦裙汉元素套装","329","298","../img/girl10_4.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","165","BOBO Angel原创改良锦鲤古装古风汉服春夏装女中国风襦裙汉元素套装","329","298","../img/girl10_4.jpg","XL","2019-3-25","2019","1");

-- #8号商品，两个种类型
-- #短款
INSERT INTO hanfu_product_list VALUES("","10","166","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_1.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","167","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","168","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","189","188","../img/girl11_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","169","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","170","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_1.jpg","XL","2019-3-25","2019","1");

-- #长款
INSERT INTO hanfu_product_list VALUES("","10","171","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_2.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","172","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_2.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","173","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","189","188","../img/girl11_2.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","174","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_2.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","175","丸涵新款改良广袖汉服女交领襦裙日常学生装汉元素套装班服中国风古装","199","188","../img/girl11_2.jpg","XL","2019-3-25","2019","1");

-- #9号商品，一颜色
INSERT INTO hanfu_product_list VALUES("","10","176","雅帝泽2019新款锦鲤改良汉服女学生汉元素古装襦裙古风日常仙女装","166","109","../img/girl12_1.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","177","雅帝泽2019新款锦鲤改良汉服女学生汉元素古装襦裙古风日常仙女装","166","109","../img/girl12_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","178","雅帝泽2019新款锦鲤改良汉服女学生汉元素古装襦裙古风日常仙女装","166","109","../img/girl12_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","179","雅帝泽2019新款锦鲤改良汉服女学生汉元素古装襦裙古风日常仙女装","166","109","../img/girl12_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","180","雅帝泽2019新款锦鲤改良汉服女学生汉元素古装襦裙古风日常仙女装","166","109","../img/girl12_1.jpg","XL","2019-3-25","2019","1");

-- #10号商品，四个颜色
-- #红色上衣，米白色裙子
INSERT INTO hanfu_product_list VALUES("","10","181","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_1.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","182","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","183","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","184","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","185","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_1.jpg","XL","2019-3-25","2019","1");

-- #米色上衣，红色裙子
INSERT INTO hanfu_product_list VALUES("","10","186","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_3.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","187","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","188","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","189","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","190","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_3.jpg","XL","2019-3-25","2019","1");

-- #米白色上衣，粉色裙子
INSERT INTO hanfu_product_list VALUES("","10","186","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_5.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","187","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_5.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","188","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_5.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","189","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_5.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","190","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_5.jpg","XL","2019-3-25","2019","1");

-- #粉色上衣，米白色裙子
INSERT INTO hanfu_product_list VALUES("","10","191","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_6.jpg","XS","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","192","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_6.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","193","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_6.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","194","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_6.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","10","195","高档古装汉服女装襦裙中国风元旦年会古典舞蹈古筝演出服成人礼","399","299","../img/girl13_6.jpg","XL","2019-3-25","2019","1");

-- #男装,1号商品
-- #白红
INSERT INTO hanfu_product_list VALUES("","20","201","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_2.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","202","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_2.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","203","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_2.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","204","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_2.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","205","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_2.jpg","XXL","2019-3-25","2019","1");

-- #蓝白
INSERT INTO hanfu_product_list VALUES("","20","206","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_4.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","207","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_4.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","208","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_4.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","209","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_4.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","210","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_4.jpg","XXL","2019-3-25","2019","1");

-- #男装，2号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","20","211","汉服男装古装长袍原创传统男装绣花大氅汉服氅衣广袖大袖衫非古装外套上衣下裳套装","169","159","../img/boy2_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","212","汉服男装古装长袍原创传统男装绣花大氅汉服氅衣广袖大袖衫非古装外套上衣下裳套装","169","159","../img/boy2_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","213","汉服男装古装长袍原创传统男装绣花大氅汉服氅衣广袖大袖衫非古装外套上衣下裳套装","169","159","../img/boy2_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","214","汉服男装古装长袍原创传统男装绣花大氅汉服氅衣广袖大袖衫非古装外套上衣下裳套装","169","159","../img/boy2_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","215","汉服男装古装长袍原创传统男装绣花大氅汉服氅衣广袖大袖衫非古装外套上衣下裳套装","169","159","../img/boy2_1.jpg","XXL","2019-3-25","2019","1");

-- #男装，3号商品，两个颜色
-- #白色
INSERT INTO hanfu_product_list VALUES("","20","216","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","217","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","218","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","219","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","220","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_1.jpg","XXL","2019-3-25","2019","1");

-- #蓝色
INSERT INTO hanfu_product_list VALUES("","20","221","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","222","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","223","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","224","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_3.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","225","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_3.jpg","XXL","2019-3-25","2019","1");

-- #男装，4号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","20","226","cos古装男汉唐有梦凤歌鸾汉服男古装汉装古风侠客书生cos服魏晋中国风春秋 黑灰两件套 S","128","98","../img/boy4_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","227","cos古装男汉唐有梦凤歌鸾汉服男古装汉装古风侠客书生cos服魏晋中国风春秋 黑灰两件套 S","128","98","../img/boy4_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","228","cos古装男汉唐有梦凤歌鸾汉服男古装汉装古风侠客书生cos服魏晋中国风春秋 黑灰两件套 S","128","98","../img/boy4_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","229","cos古装男汉唐有梦凤歌鸾汉服男古装汉装古风侠客书生cos服魏晋中国风春秋 黑灰两件套 S","128","98","../img/boy4_3.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","230","cos古装男汉唐有梦凤歌鸾汉服男古装汉装古风侠客书生cos服魏晋中国风春秋 黑灰两件套 S","128","98","../img/boy4_3.jpg","XXL","2019-3-25","2019","1");

-- #男装5号商品，两个颜色
-- #浅色
INSERT INTO hanfu_product_list VALUES("","20","231","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","232","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","233","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","234","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","235","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_1.jpg","XXL","2019-3-25","2019","1");

-- #青色
INSERT INTO hanfu_product_list VALUES("","20","236","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_5.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","237","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_5.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","238","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_5.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","239","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_5.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","240","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_5.jpg","XXL","2019-3-25","2019","1");

-- #男装6号商品，两个颜色
-- #黑色
INSERT INTO hanfu_product_list VALUES("","20","241","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","242","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","243","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","244","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","245","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_1.jpg","XXL","2019-3-25","2019","1");

-- #米白
INSERT INTO hanfu_product_list VALUES("","20","246","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_7.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","247","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_7.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","248","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_7.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","249","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_7.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","250","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_7.jpg","XXL","2019-3-25","2019","1");

-- #男装7号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","20","251","汉服男装古装长袍改良男装汉服套装男中国风古装武侠剑客交领襦裙两件套夜行衣班服","228","208","../img/boy7_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","252","汉服男装古装长袍改良男装汉服套装男中国风古装武侠剑客交领襦裙两件套夜行衣班服","228","208","../img/boy7_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","253","汉服男装古装长袍改良男装汉服套装男中国风古装武侠剑客交领襦裙两件套夜行衣班服","228","208","../img/boy7_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","254","汉服男装古装长袍改良男装汉服套装男中国风古装武侠剑客交领襦裙两件套夜行衣班服","228","208","../img/boy7_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","255","汉服男装古装长袍改良男装汉服套装男中国风古装武侠剑客交领襦裙两件套夜行衣班服","228","208","../img/boy7_1.jpg","XXL","2019-3-25","2019","1");

-- #男装8号商品，两个颜色
-- #白色
INSERT INTO hanfu_product_list VALUES("","20","256","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","257","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","258","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","259","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","260","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_1.jpg","XXL","2019-3-25","2019","1");

-- #黑色
INSERT INTO hanfu_product_list VALUES("","20","261","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_2.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","262","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_2.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","263","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_2.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","264","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_2.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","265","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_2.jpg","XXL","2019-3-25","2019","1");

-- #男装9号商品，两个颜色
-- #米黄
INSERT INTO hanfu_product_list VALUES("","20","266","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","267","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","268","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","269","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_3.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","270","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_3.jpg","XXL","2019-3-25","2019","1");

-- #浅蓝
INSERT INTO hanfu_product_list VALUES("","20","271","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","272","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","273","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","274","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","275","汉服男装古装长袍魏晋古风男装刺绣交领襦裙大袖衫上襦汉服男书生古装二件套班服秋","168","158","../img/boy9_1.jpg","XXL","2019-3-25","2019","1");

-- #男装10号商品
INSERT INTO hanfu_product_list VALUES("","20","276","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","268","198","../img/boy10_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","277","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","268","198","../img/boy10_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","278","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","268","188","../img/boy10_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","279","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","268","188","../img/boy10_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","20","280","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","268","198","../img/boy10_1.jpg","XXL","2019-3-25","2019","1");

-- #童装，女宝
-- #1号商品，一种颜色
INSERT INTO hanfu_product_list VALUES("","30","301","汉服女装襦裙仙女裙儿童儿童汉服古装刺绣齐胸襦裙女童改良款民族连衣裙春秋季宝宝女唐装","168","98","../img/cg1_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","302","汉服女装襦裙仙女裙儿童儿童汉服古装刺绣齐胸襦裙女童改良款民族连衣裙春秋季宝宝女唐装","168","98","../img/cg1_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","303","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","168","98","../img/cg1_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","304","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","168","98","../img/cg1_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","305","汉服男装古装长袍魏晋风汉服广袖黑色男装云绣春夏季对襟大袖衫武侠书生班服日常装汉服圈","168","98","../img/cg1_1.jpg","XXL","2019-3-25","2019","1");

-- #女宝2号商品，两种颜色
-- #粉色
INSERT INTO hanfu_product_list VALUES("","30","306","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_4.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","307","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_4.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","308","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","98","../img/cg2_4.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","309","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_4.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","310","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_4.jpg","XXL","2019-3-25","2019","1");

-- #粉色
INSERT INTO hanfu_product_list VALUES("","30","311","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","312","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","313","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","98","../img/cg2_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","314","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_3.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","315","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_4.jpg","XXL","2019-3-25","2019","1");

-- #女宝3号商品,一个颜色
INSERT INTO hanfu_product_list VALUES("","30","316","汉服女装襦裙仙女裙儿童儿童古装汉服仙女公主改良小女孩中国风超仙女童春秋襦裙唐装飘逸","108","98","../img/cg3_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","317","汉服女装襦裙仙女裙儿童儿童古装汉服仙女公主改良小女孩中国风超仙女童春秋襦裙唐装飘逸","108","98","../img/cg3_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","318","汉服女装襦裙仙女裙儿童儿童古装汉服仙女公主改良小女孩中国风超仙女童春秋襦裙唐装飘逸","108","98","../img/cg3_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","319","汉服女装襦裙仙女裙儿童儿童古装汉服仙女公主改良小女孩中国风超仙女童春秋襦裙唐装飘逸","108","98","../img/cg3_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","320","汉服女装襦裙仙女裙儿童儿童古装汉服仙女公主改良小女孩中国风超仙女童春秋襦裙唐装飘逸","108","98","../img/cg3_1.jpg","XXL","2019-3-25","2019","1");

-- #女宝4号商品,三个个颜色
-- #玫红色
INSERT INTO hanfu_product_list VALUES("","30","321","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","322","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","323","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","324","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","325","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_1.jpg","XXL","2019-3-25","2019","1");

-- #浅紫色
INSERT INTO hanfu_product_list VALUES("","30","326","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_2.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","327","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_2.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","328","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_2.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","329","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_2.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","330","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_2.jpg","XXL","2019-3-25","2019","1");

-- #青色
INSERT INTO hanfu_product_list VALUES("","30","331","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_4.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","332","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_4.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","333","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_4.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","334","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_4.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","335","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_4.jpg","XXL","2019-3-25","2019","1");

--#女宝5号商品
--#淡粉色
INSERT INTO hanfu_product_list VALUES("","30","336","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","337","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","338","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","339","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","340","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_1.jpg","XXL","2019-3-25","2019","1");

-- #白色
INSERT INTO hanfu_product_list VALUES("","30","341","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","342","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","343","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","344","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_3.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","345","2018新品长袖汉服套装中大童10岁11岁12岁13岁14岁女孩子复古套裙中国风上衣+女童套裙两件套","138","109","../img/cg5_3.jpg","XXL","2019-3-25","2019","1");

-- #童装男宝1号商品，两个颜色
-- #浅蓝
INSERT INTO hanfu_product_list VALUES("","30","346","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","347","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","348","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","349","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","350","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_1.jpg","XXL","2019-3-25","2019","1");

-- #红色
INSERT INTO hanfu_product_list VALUES("","30","351","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_4.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","352","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_4.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","353","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_4.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","354","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_4.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","355","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_4.jpg","XXL","2019-3-25","2019","1");

-- #男宝2号商品。一个颜色
INSERT INTO hanfu_product_list VALUES("","30","356","古装汉服男童国学演出服小学生女童舞蹈服长袖表演服装书童送帽子","169","129","../img/cb2_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","357","古装汉服男童国学演出服小学生女童舞蹈服长袖表演服装书童送帽子","169","129","../img/cb2_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","358","古装汉服男童国学演出服小学生女童舞蹈服长袖表演服装书童送帽子","169","129","../img/cb2_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","359","古装汉服男童国学演出服小学生女童舞蹈服长袖表演服装书童送帽子","169","129","../img/cb2_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","360","古装汉服男童国学演出服小学生女童舞蹈服长袖表演服装书童送帽子","169","129","../img/cb2_1.jpg","XXL","2019-3-25","2019","1");

-- #男宝3号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","30","361","儿童汉服男古装书童汉服国学小学男开笔礼孔子弟子规演出诵读春秋","139","129","../img/cb3_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","362","儿童汉服男古装书童汉服国学小学男开笔礼孔子弟子规演出诵读春秋","139","129","../img/cb3_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","363","儿童汉服男古装书童汉服国学小学男开笔礼孔子弟子规演出诵读春秋","139","129","../img/cb3_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","364","儿童汉服男古装书童汉服国学小学男开笔礼孔子弟子规演出诵读春秋","139","129","../img/cb3_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","365","儿童汉服男古装书童汉服国学小学男开笔礼孔子弟子规演出诵读春秋","139","129","../img/cb3_1.jpg","XXL","2019-3-25","2019","1");

-- #男宝4号商品，
-- #三个颜色
INSERT INTO hanfu_product_list VALUES("","30","366","宝宝汉服春秋男童古装夏季套装改良周岁中国风复古儿童汉服男唐装","99","89","../img/cb4_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","367","宝宝汉服春秋男童古装夏季套装改良周岁中国风复古儿童汉服男唐装","99","89","../img/cb4_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","368","宝宝汉服春秋男童古装夏季套装改良周岁中国风复古儿童汉服男唐装","99","89","../img/cb4_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","369","宝宝汉服春秋男童古装夏季套装改良周岁中国风复古儿童汉服男唐装","99","89","../img/cb4_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","370","宝宝汉服春秋男童古装夏季套装改良周岁中国风复古儿童汉服男唐装","99","89","../img/cb3_1.jpg","XXL","2019-3-25","2019","1");

-- #男宝5号商品，两种颜色
-- #深蓝蓝色
INSERT INTO hanfu_product_list VALUES("","30","371","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_1.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","372","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_1.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","373","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_1.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","374","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_1.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","375","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_1.jpg","XXL","2019-3-25","2019","1");

-- #天蓝色
INSERT INTO hanfu_product_list VALUES("","30","376","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_3.jpg","S","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","377","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_3.jpg","M","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","378","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_3.jpg","L","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","379","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_3.jpg","XL","2019-3-25","2019","1");
INSERT INTO hanfu_product_list VALUES("","30","380","儿童汉服小男孩中国风男童古装小书童国学服六一表演服装复古春装","188","169","../img/cb5_3.jpg","XXL","2019-3-25","2019","1");

-- #创建商品家族列表hanfu_product_family
CREATE TABLE hanfu_product_family(
fid INT,          #家族编号
f_name VARCHAR(32)    #家族名称
);


-- #往hanfu_product_family中插入数据
INSERT INTO hanfu_product_family VALUES("10","女装");
INSERT INTO hanfu_product_family VALUES("20","男装");
INSERT INTO hanfu_product_family VALUES("30","童装");
INSERT INTO hanfu_product_family VALUES("40","闺蜜装");
INSERT INTO hanfu_product_family VALUES("50","亲子装");
INSERT INTO hanfu_product_family VALUES("60","情侣装");
INSERT INTO hanfu_product_family VALUES("70","鞋子");
INSERT INTO hanfu_product_family VALUES("80","颈饰");
INSERT INTO hanfu_product_family VALUES("90","耳饰");
INSERT INTO hanfu_product_family VALUES("100","手饰");
INSERT INTO hanfu_product_family VALUES("110","头饰");
INSERT INTO hanfu_product_family VALUES("120","其他");

--#创建商品详情图片hanfu_product_detail表
--#pid中详情页图片，女孩装从1到10  男装从11到20 女宝从21到25 男宝从26到30
--#img_src详情页图片路径，详情页最多30张照片，所以最多到img30_src
CrEATE TABLE hanfu_product_detail(
 pid INT PRIMARY KEY AUTO_INCREMENT,  
 img1_src VARCHAR(128),
 img2_src VARCHAR(128),
 img3_src VARCHAR(128),
 img4_src VARCHAR(128),
 img5_src VARCHAR(128),
 img6_src VARCHAR(128),
 img7_src VARCHAR(128),
 img8_src VARCHAR(128),
 img9_src VARCHAR(128),
 img10_src VARCHAR(128),
 img11_src VARCHAR(128),
 img12_src VARCHAR(128),
 img13_src VARCHAR(128),
 img14_src VARCHAR(128),
 img15_src VARCHAR(128),
 img16_src VARCHAR(128),
 img17_src VARCHAR(128),
 img18_src VARCHAR(128),
 img19_src VARCHAR(128),
 img20_src VARCHAR(128),
 img21_src VARCHAR(128),
 img22_src VARCHAR(128),
 img23_src VARCHAR(128),
 img24_src VARCHAR(128),
 img25_src VARCHAR(128),
 img26_src VARCHAR(128),
 img27_src VARCHAR(128),
 img28_src VARCHAR(128),
 img29_src VARCHAR(128),
 img30_src VARCHAR(128)
);

-- #往hanfu_product_detail表中插数据
-- 女一,现有29张图片，
INSERT INTO hanfu_product_detail VALUES(
  1,
  "../img/girl1_2.jpg",
  "../img/girl1_3.jpg",
  "../img/girl1_4.jpg",
  "../img/girl1_5.jpg",
  "../img/girl1_6.jpg",
  "../img/girl1_7.jpg",
  "../img/girl1_8.jpg",
  "../img/girl1_9.jpg",
  "../img/girl1_10.jpg",
  "../img/girl1_11.jpg",
  "../img/girl1_12.jpg",
  "../img/girl1_13.jpg",
  "../img/girl1_14.jpg",
  "../img/girl1_15.jpg",
  "../img/girl1_16.jpg",
  "../img/girl1_17.jpg",
  "../img/girl1_18.jpg",
  "../img/girl1_19.jpg",
  "../img/girl1_20.jpg",
  "../img/girl1_21.jpg",
  "../img/girl1_22.jpg",
  "../img/girl1_23.jpg",
  "../img/girl1_24.jpg",
  "../img/girl1_25.jpg",
  "../img/girl1_26.jpg",
  "../img/girl1_27.jpg",
  "../img/girl1_28.jpg",
  "../img/girl1_29.jpg",
  "../img/girl1_30.jpg",
  "");
-- 女二，现有16张图片，其余14张为空
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl2_1.jpg",
  "../img/girl2_2.jpg",
  "../img/girl2_3.jpg",
  "../img/girl2_4.jpg",
  "../img/girl2_5.jpg",
  "../img/girl2_6.jpg",
  "../img/girl2_7.jpg",
  "../img/girl2_8.jpg",
  "../img/girl2_9.jpg",
  "../img/girl2_10.jpg",
  "../img/girl2_11.jpg",
  "../img/girl2_12.jpg",
  "../img/girl2_13.jpg",
  "../img/girl2_14.jpg",
  "../img/girl2_15.jpg",
  "../img/girl2_16.jpg",
  "../img/girl2_17.jpg",
  "../img/girl2_18.jpg",
  "../img/girl2_19.jpg",
  "../img/girl2_20.jpg",
  "../img/girl2_21.jpg",
  "../img/girl2_22.jpg",
  "../img/girl2_23.jpg",
  "../img/girl2_24.jpg",
  "../img/girl2_25.jpg",
  "../img/girl2_26.jpg",
  "../img/girl2_27.jpg",
  "../img/girl2_28.jpg",
  "../img/girl2_29.jpg",
  "../img/girl2_30.jpg");
-- -- 女三，现有27张图片，其余3张为空
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl3_1.jpg",
  "../img/girl3_2.jpg",
  "../img/girl3_3.jpg",
  "../img/girl3_4.jpg",
  "../img/girl3_5.jpg",
  "../img/girl3_6.jpg",
  "../img/girl3_7.jpg",
  "../img/girl3_8.jpg",
  "../img/girl3_9.jpg",
  "../img/girl3_10.jpg",
  "../img/girl3_11.jpg",
  "../img/girl3_12.jpg",
  "../img/girl3_13.jpg",
  "../img/girl3_14.jpg",
  "../img/girl3_15.jpg",
  "../img/girl3_16.jpg",
  "../img/girl3_17.jpg",
  "../img/girl3_18.jpg",
  "../img/girl3_19.jpg",
  "../img/girl3_20.jpg",
  "../img/girl3_21.jpg",
  "../img/girl3_22.jpg",
  "../img/girl3_23.jpg",
  "../img/girl3_24.jpg",
  "../img/girl3_25.jpg",
  "../img/girl3_26.jpg",
  "../img/girl3_27.jpg",
  "../img/girl3_28.jpg",
  "../img/girl3_29.jpg",
  "../img/girl3_30.jpg");

-- -- 女四，一共26张图片，其余4个为空
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl5_1.jpg",
  "../img/girl5_2.jpg",
  "../img/girl5_3.jpg",
  "../img/girl5_4.jpg",
  "../img/girl5_5.jpg",
  "../img/girl5_6.jpg",
  "../img/girl5_7.jpg",
  "../img/girl5_8.jpg",
  "../img/girl5_9.jpg",
  "../img/girl5_10.jpg",
  "../img/girl5_11.jpg",
  "../img/girl5_12.jpg",
  "../img/girl5_13.jpg",
  "../img/girl5_14.jpg",
  "../img/girl5_15.jpg",
  "../img/girl5_16.jpg",
  "../img/girl5_17.jpg",
  "../img/girl5_18.jpg",
  "../img/girl5_19.jpg",
  "../img/girl5_20.jpg",
  "../img/girl5_21.jpg",
  "../img/girl5_22.jpg",
  "../img/girl5_23.jpg",
  "../img/girl5_24.jpg",
  "../img/girl5_25.jpg",
  "../img/girl5_26.jpg",
  "../img/girl5_27.jpg",
  "../img/girl5_28.jpg",
  "../img/girl5_29.jpg",
  "../img/girl5_30.jpg");
-- 女五，一共29张图片，其余1个为空
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl8_1.jpg",
  "../img/girl8_2.jpg",
  "../img/girl8_3.jpg",
  "../img/girl8_4.jpg",
  "../img/girl8_5.jpg",
  "../img/girl8_6.jpg",
  "../img/girl8_7.jpg",
  "../img/girl8_8.jpg",
  "../img/girl8_9.jpg",
  "../img/girl8_10.jpg",
  "../img/girl8_11.jpg",
  "../img/girl8_12.jpg",
  "../img/girl8_13.jpg",
  "../img/girl8_14.jpg",
  "../img/girl8_15.jpg",
  "../img/girl8_16.jpg",
  "../img/girl8_17.jpg",
  "../img/girl8_18.jpg",
  "../img/girl8_19.jpg",
  "../img/girl8_20.jpg",
  "../img/girl8_21.jpg",
  "../img/girl8_22.jpg",
  "../img/girl8_23.jpg",
  "../img/girl8_24.jpg",
  "../img/girl8_25.jpg",
  "../img/girl8_26.jpg",
  "../img/girl8_27.jpg",
  "../img/girl8_28.jpg",
  "../img/girl8_29.jpg",
  "../img/girl8_30.jpg");

-- 女六 共有17张图片，其他为空
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl9_1.jpg",
  "../img/girl9_2.jpg",
  "../img/girl9_3.jpg",
  "../img/girl9_4.jpg",
  "../img/girl9_5.png",
  "../img/girl9_6.png",
  "../img/girl9_7.png",
  "../img/girl9_8.png",
  "../img/girl9_9.png",
  "../img/girl9_10.png",
  "../img/girl9_11.png",
  "../img/girl9_12.png",
  "../img/girl9_13.png",
  "../img/girl9_14.png",
  "../img/girl9_15.png",
  "../img/girl9_16.png",
  "../img/girl9_17.jpg",
  "../img/girl9_18.jpg",
  "../img/girl9_19.jpg",
  "../img/girl9_20.jpg",
  "../img/girl9_21.jpg",
  "../img/girl9_22.jpg",
  "../img/girl9_23.jpg",
  "../img/girl9_24.jpg",
  "../img/girl9_25.jpg",
  "../img/girl9_26.jpg",
  "../img/girl9_27.jpg",
  "../img/girl9_28.jpg",
  "../img/girl9_29.jpg",
  "../img/girl9_30.jpg");

-- #女七 共25张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl10_1.jpg",
  "../img/girl10_2.jpg",
  "../img/girl10_3.jpg",
  "../img/girl10_4.jpg",
  "../img/girl10_5.png",
  "../img/girl10_6.png",
  "../img/girl10_7.png",
  "../img/girl10_8.png",
  "../img/girl10_9.png",
  "../img/girl10_10.png",
  "../img/girl10_11.png",
  "../img/girl10_12.png",
  "../img/girl10_13.png",
  "../img/girl10_14.png",
  "../img/girl10_15.png",
  "../img/girl10_16.png",
  "../img/girl10_17.jpg",
  "../img/girl10_18.jpg",
  "../img/girl10_19.jpg",
  "../img/girl10_20.jpg",
  "../img/girl10_21.jpg",
  "../img/girl10_22.jpg",
  "../img/girl10_23.jpg",
  "../img/girl10_24.jpg",
  "../img/girl10_25.jpg",
  "../img/girl10_26.jpg",
  "../img/girl10_27.jpg",
  "../img/girl10_28.jpg",
  "../img/girl10_29.jpg",
  "../img/girl10_30.jpg");

-- #女八 共10张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl11_1.jpg",
  "../img/girl11_2.jpg",
  "../img/girl11_3.jpg",
  "../img/girl11_4.jpg",
  "../img/girl11_5.png",
  "../img/girl11_6.png",
  "../img/girl11_7.png",
  "../img/girl11_8.png",
  "../img/girl11_9.png",
  "../img/girl11_10.png",
  "../img/girl11_11.png",
  "../img/girl11_12.png",
  "../img/girl11_13.png",
  "../img/girl11_14.png",
  "../img/girl11_15.png",
  "../img/girl11_16.png",
  "../img/girl11_17.jpg",
  "../img/girl11_18.jpg",
  "../img/girl11_19.jpg",
  "../img/girl11_20.jpg",
  "../img/girl11_21.jpg",
  "../img/girl11_22.jpg",
  "../img/girl11_23.jpg",
  "../img/girl11_24.jpg",
  "../img/girl11_25.jpg",
  "../img/girl11_26.jpg",
  "../img/girl11_27.jpg",
  "../img/girl11_28.jpg",
  "../img/girl11_29.jpg",
  "../img/girl11_30.jpg");

-- #女九 共26张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl12_1.jpg",
  "../img/girl12_2.jpg",
  "../img/girl12_3.jpg",
  "../img/girl12_4.jpg",
  "../img/girl12_5.png",
  "../img/girl12_6.png",
  "../img/girl12_7.png",
  "../img/girl12_8.png",
  "../img/girl12_9.png",
  "../img/girl12_10.png",
  "../img/girl12_11.png",
  "../img/girl12_12.png",
  "../img/girl12_13.png",
  "../img/girl12_14.png",
  "../img/girl12_15.png",
  "../img/girl12_16.png",
  "../img/girl12_17.jpg",
  "../img/girl12_18.jpg",
  "../img/girl12_19.jpg",
  "../img/girl12_20.jpg",
  "../img/girl12_21.jpg",
  "../img/girl12_22.jpg",
  "../img/girl12_23.jpg",
  "../img/girl12_24.jpg",
  "../img/girl12_25.jpg",
  "../img/girl12_26.jpg",
  "../img/girl12_27.jpg",
  "../img/girl12_28.jpg",
  "../img/girl12_29.jpg",
  "../img/girl12_30.jpg");

-- 女十 共13张图片

-- #女九 共26张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl13_1.jpg",
  "../img/girl13_2.jpg",
  "../img/girl13_3.jpg",
  "../img/girl13_4.jpg",
  "../img/girl13_5.png",
  "../img/girl13_6.png",
  "../img/girl13_7.png",
  "../img/girl13_9.png",
  "../img/girl13_10.png",
  "../img/girl13_11.png",
  "../img/girl13_12.png",
  "../img/girl13_13.png",
  "../img/girl13_15.png",
  "../img/girl13_16.png",
  "../img/girl13_17.png",
  "../img/girl13_18.png",
  "../img/girl13_19.jpg",
  "../img/girl13_20.jpg",
  "../img/girl13_21.jpg",
  "../img/girl13_22.jpg",
  "../img/girl13_23.jpg",
  "../img/girl13_24.jpg",
  "../img/girl13_25.jpg",
  "../img/girl13_26.jpg",
  "../img/girl13_27.jpg",
  "../img/girl13_28.jpg",
  "../img/girl13_29.jpg",
  "../img/girl13_30.jpg",
  "../img/girl13_31.jpg",
  "../img/girl13_32.jpg");

--男装 1号，20张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy1_1.jpg",
  "../img/boy1_2.jpg",
  "../img/boy1_3.jpg",
  "../img/boy1_4.jpg",
  "../img/boy1_5.png",
  "../img/boy1_6.png",
  "../img/boy1_7.png",
  "../img/boy1_8.png",
  "../img/boy1_9.png",
  "../img/boy1_10.png",
  "../img/boy1_11.png",
  "../img/boy1_12.png",
  "../img/boy1_13.png",
  "../img/boy1_14.png",
  "../img/boy1_15.png",
  "../img/boy1_16.png",
  "../img/boy1_17.jpg",
  "../img/boy1_18.jpg",
  "../img/boy1_19.jpg",
  "../img/boy1_20.jpg",
  "../img/boy1_21.jpg",
  "../img/boy1_22.jpg",
  "../img/boy1_23.jpg",
  "../img/boy1_24.jpg",
  "../img/boy1_25.jpg",
  "../img/boy1_26.jpg",
  "../img/boy1_27.jpg",
  "../img/boy1_38.jpg",
  "../img/boy1_29.jpg",
  "../img/boy1_30.jpg"); 

-- #男装 2号商品，15张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy2_1.jpg",
  "../img/boy2_2.jpg",
  "../img/boy2_3.jpg",
  "../img/boy2_4.jpg",
  "../img/boy2_5.png",
  "../img/boy2_6.png",
  "../img/boy2_7.png",
  "../img/boy2_8.png",
  "../img/boy2_9.png",
  "../img/boy2_10.png",
  "../img/boy2_11.png",
  "../img/boy2_12.png",
  "../img/boy2_13.png",
  "../img/boy2_14.png",
  "../img/boy2_15.png",
  "../img/boy2_16.png",
  "../img/boy2_17.jpg",
  "../img/boy2_18.jpg",
  "../img/boy2_19.jpg",
  "../img/boy2_20.jpg",
  "../img/boy2_21.jpg",
  "../img/boy2_22.jpg",
  "../img/boy2_23.jpg",
  "../img/boy2_24.jpg",
  "../img/boy2_25.jpg",
  "../img/boy2_26.jpg",
  "../img/boy2_27.jpg",
  "../img/boy2_38.jpg",
  "../img/boy2_29.jpg",
  "../img/boy2_30.jpg"); 

-- #男装3号商品，27张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy3_1.jpg",
  "../img/boy3_2.jpg",
  "../img/boy3_3.jpg",
  "../img/boy3_4.jpg",
  "../img/boy3_5.png",
  "../img/boy3_6.png",
  "../img/boy3_7.png",
  "../img/boy3_8.png",
  "../img/boy3_9.png",
  "../img/boy3_10.png",
  "../img/boy3_11.png",
  "../img/boy3_12.png",
  "../img/boy3_13.png",
  "../img/boy3_14.png",
  "../img/boy3_15.png",
  "../img/boy3_16.png",
  "../img/boy3_17.jpg",
  "../img/boy3_18.jpg",
  "../img/boy3_19.jpg",
  "../img/boy3_20.jpg",
  "../img/boy3_21.jpg",
  "../img/boy3_22.jpg",
  "../img/boy3_23.jpg",
  "../img/boy3_24.jpg",
  "../img/boy3_25.jpg",
  "../img/boy3_26.jpg",
  "../img/boy3_27.jpg",
  "../img/boy3_38.jpg",
  "../img/boy3_29.jpg",
  "../img/boy3_30.jpg"); 

-- 男装4号商品，20张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy4_1.jpg",
  "../img/boy4_2.jpg",
  "../img/boy4_3.jpg",
  "../img/boy4_4.jpg",
  "../img/boy4_5.png",
  "../img/boy4_6.png",
  "../img/boy4_7.png",
  "../img/boy4_8.png",
  "../img/boy4_9.png",
  "../img/boy4_10.png",
  "../img/boy4_11.png",
  "../img/boy4_12.png",
  "../img/boy4_13.png",
  "../img/boy4_14.png",
  "../img/boy4_15.png",
  "../img/boy4_16.png",
  "../img/boy4_17.jpg",
  "../img/boy4_18.jpg",
  "../img/boy4_19.jpg",
  "../img/boy4_20.jpg",
  "../img/boy4_21.jpg",
  "../img/boy4_22.jpg",
  "../img/boy4_23.jpg",
  "../img/boy4_24.jpg",
  "../img/boy4_25.jpg",
  "../img/boy4_26.jpg",
  "../img/boy4_27.jpg",
  "../img/boy4_38.jpg",
  "../img/boy4_29.jpg",
  "../img/boy4_30.jpg"); 

-- 男装5号商品，9张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy5_1.jpg",
  "../img/boy5_2.jpg",
  "../img/boy5_3.jpg",
  "../img/boy5_4.jpg",
  "../img/boy5_5.png",
  "../img/boy5_6.png",
  "../img/boy5_7.png",
  "../img/boy5_8.png",
  "../img/boy5_9.png",
  "../img/boy5_10.png",
  "../img/boy5_11.png",
  "../img/boy5_12.png",
  "../img/boy5_13.png",
  "../img/boy5_14.png",
  "../img/boy5_15.png",
  "../img/boy5_16.png",
  "../img/boy5_17.jpg",
  "../img/boy5_18.jpg",
  "../img/boy5_19.jpg",
  "../img/boy5_20.jpg",
  "../img/boy5_21.jpg",
  "../img/boy5_22.jpg",
  "../img/boy5_23.jpg",
  "../img/boy5_24.jpg",
  "../img/boy5_25.jpg",
  "../img/boy5_26.jpg",
  "../img/boy5_27.jpg",
  "../img/boy5_38.jpg",
  "../img/boy5_29.jpg",
  "../img/boy5_30.jpg"); 

-- #男装6号商品，共23张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy6_1.jpg",
  "../img/boy6_2.jpg",
  "../img/boy6_3.jpg",
  "../img/boy6_4.jpg",
  "../img/boy6_5.png",
  "../img/boy6_6.png",
  "../img/boy6_7.png",
  "../img/boy6_8.png",
  "../img/boy6_9.png",
  "../img/boy6_10.png",
  "../img/boy6_11.png",
  "../img/boy6_12.png",
  "../img/boy6_13.png",
  "../img/boy6_14.png",
  "../img/boy6_15.png",
  "../img/boy6_16.png",
  "../img/boy6_17.jpg",
  "../img/boy6_18.jpg",
  "../img/boy6_19.jpg",
  "../img/boy6_20.jpg",
  "../img/boy6_21.jpg",
  "../img/boy6_22.jpg",
  "../img/boy6_23.jpg",
  "../img/boy6_24.jpg",
  "../img/boy6_25.jpg",
  "../img/boy6_26.jpg",
  "../img/boy6_27.jpg",
  "../img/boy6_38.jpg",
  "../img/boy6_29.jpg",
  "../img/boy6_30.jpg"); 

-- #男装7号商品，共26张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy7_1.jpg",
  "../img/boy7_2.jpg",
  "../img/boy7_3.jpg",
  "../img/boy7_4.jpg",
  "../img/boy7_5.png",
  "../img/boy7_6.png",
  "../img/boy7_7.png",
  "../img/boy7_8.png",
  "../img/boy7_9.png",
  "../img/boy7_10.png",
  "../img/boy7_11.png",
  "../img/boy7_12.png",
  "../img/boy7_13.png",
  "../img/boy7_14.png",
  "../img/boy7_15.png",
  "../img/boy7_16.png",
  "../img/boy7_17.jpg",
  "../img/boy7_18.jpg",
  "../img/boy7_19.jpg",
  "../img/boy7_20.jpg",
  "../img/boy7_21.jpg",
  "../img/boy7_22.jpg",
  "../img/boy7_23.jpg",
  "../img/boy7_24.jpg",
  "../img/boy7_25.jpg",
  "../img/boy7_26.jpg",
  "../img/boy7_27.jpg",
  "../img/boy7_38.jpg",
  "../img/boy7_29.jpg",
  "../img/boy_30.jpg"); 

-- #男装8号商品，共24张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy8_1.jpg",
  "../img/boy8_2.jpg",
  "../img/boy8_3.jpg",
  "../img/boy8_4.jpg",
  "../img/boy8_5.png",
  "../img/boy8_6.png",
  "../img/boy8_7.png",
  "../img/boy8_8.png",
  "../img/boy8_9.png",
  "../img/boy8_10.png",
  "../img/boy8_11.png",
  "../img/boy8_12.png",
  "../img/boy8_13.png",
  "../img/boy8_14.png",
  "../img/boy8_15.png",
  "../img/boy8_16.png",
  "../img/boy8_17.jpg",
  "../img/boy8_18.jpg",
  "../img/boy8_19.jpg",
  "../img/boy8_20.jpg",
  "../img/boy8_21.jpg",
  "../img/boy8_22.jpg",
  "../img/boy8_23.jpg",
  "../img/boy8_24.jpg",
  "../img/boy8_25.jpg",
  "../img/boy8_26.jpg",
  "../img/boy8_27.jpg",
  "../img/boy8_38.jpg",
  "../img/boy8_29.jpg",
  "../img/boy8_30.jpg"); 

-- #男装9号商品，25张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy9_1.jpg",
  "../img/boy9_2.jpg",
  "../img/boy9_3.jpg",
  "../img/boy9_4.jpg",
  "../img/boy9_5.png",
  "../img/boy9_6.png",
  "../img/boy9_7.png",
  "../img/boy9_8.png",
  "../img/boy9_9.png",
  "../img/boy9_10.png",
  "../img/boy9_11.png",
  "../img/boy9_12.png",
  "../img/boy9_13.png",
  "../img/boy9_14.png",
  "../img/boy9_15.png",
  "../img/boy9_16.png",
  "../img/boy9_17.jpg",
  "../img/boy9_18.jpg",
  "../img/boy9_19.jpg",
  "../img/boy9_20.jpg",
  "../img/boy9_21.jpg",
  "../img/boy9_22.jpg",
  "../img/boy9_23.jpg",
  "../img/boy9_24.jpg",
  "../img/boy9_25.jpg",
  "../img/boy9_26.jpg",
  "../img/boy9_27.jpg",
  "../img/boy9_38.jpg",
  "../img/boy9_29.jpg",
  "../img/boy9_30.jpg"); 

-- #男装10号商品，共17张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy10_1.jpg",
  "../img/boy10_2.jpg",
  "../img/boy10_3.jpg",
  "../img/boy10_4.jpg",
  "../img/boy10_5.png",
  "../img/boy10_6.png",
  "../img/boy10_7.png",
  "../img/boy10_8.png",
  "../img/boy10_9.png",
  "../img/boy10_10.png",
  "../img/boy10_11.png",
  "../img/boy10_12.png",
  "../img/boy10_13.png",
  "../img/boy10_14.png",
  "../img/boy10_15.png",
  "../img/boy10_16.png",
  "../img/boy10_17.jpg",
  "../img/boy10_18.jpg",
  "../img/boy10_19.jpg",
  "../img/boy10_20.jpg",
  "../img/boy10_21.jpg",
  "../img/boy10_22.jpg",
  "../img/boy10_23.jpg",
  "../img/boy10_24.jpg",
  "../img/boy10_25.jpg",
  "../img/boy10_26.jpg",
  "../img/boy10_27.jpg",
  "../img/boy10_38.jpg",
  "../img/boy10_29.jpg",
  "../img/boy10_30.jpg");

-- #轮播图广告商品
CREATE TABLE hanfu_index_carousel(
cid INT PRIMARY KEY  AUTO_INCREMENT,
img  VARCHAR(320),          --#图片路径
title VARCHAR(128),         --#图片标题
herf  VARCHAR(320)          --#图片跳转
);

--#往hanfu_index_carouse里添加数据
INSERT INTO hanfu_index_carousel VALUES(1,"../img/top_lunbo8_1.jpg","l首页轮播广告商品1","");
INSERT INTO hanfu_index_carousel VALUES("","../img/top_lunbo9_2.jpg","l首页轮播广告商品2","");
INSERT INTO hanfu_index_carousel VALUES("","../img/top_lunbo10_1.jpg","l首页轮播广告商品3","");
INSERT INTO hanfu_index_carousel VALUES("","../img/top_lunbo11_1.jpg","l首页轮播广告商品4","");
