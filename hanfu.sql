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
  uname VARCHAR(128),
  upwd VARCHAR(128),
  email VARCHAR(128),
  phone CHAR(128),
  avatar VARCHAR(65535),        --#头像图片路径
  user_name VARCHAR(128),      --#用户的真实姓名
  gender  TINYINT,            --#性别0-> 女，1->男
  birthday DATETIME
);

-- #往用户信息表中插入数据


-- #创建用户地址表hanfu_receiver_address
CREATE TABLE hanfu_receiver_adderss(
  aid INT PRIMARY KEY AUTO_INCREMENT, --#地址编号
  user_id INT,                --#用户编号
  receiver VARCHAR(128),       --#接收人姓名
  province  VARCHAR(128),      --#省
  city  VARCHAR(128),          --#市
  county VARCHAR(128),         --#县
  address VARCHAR(128),       --#详细地址
  cellphone VARCHAR(128),      --#手机
  fixedphone VARCHAR(128),     --#固定电话
  postcode CHAR(128),           --#邮编
  tag  VARCHAR(128),           --#标签名
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

--#创建用户订单详情表hanfu_order_detail
CREATE TABLE hanfu_order_detail(
 did INT PRIMARY KEY AUTO_INCREMENT,
 order_id INT,                  --#订单编号
 product_id INT,                --#产品编号
 count INT                      --#购买数量
);




-- #创建商品家族列表hanfu_product_family
CREATE TABLE hanfu_product_family(
fid INT,          #家族编号
f_name VARCHAR(32)    #家族名称
);

-- #往hanfu_product_family（商品家族列表）中插入数据
INSERT INTO hanfu_product_family VALUES("1","女装1号商品");
INSERT INTO hanfu_product_family VALUES("2","女装2号商品");
INSERT INTO hanfu_product_family VALUES("3","女装3号商品");
INSERT INTO hanfu_product_family VALUES("4","女装4号商品");
INSERT INTO hanfu_product_family VALUES("5","女装5号商品");
INSERT INTO hanfu_product_family VALUES("6","女装6号商品");
INSERT INTO hanfu_product_family VALUES("7","女装7号商品");
INSERT INTO hanfu_product_family VALUES("8","女装8号商品");
INSERT INTO hanfu_product_family VALUES("9","女装9号商品");
INSERT INTO hanfu_product_family VALUES("10","男装1号商品");
INSERT INTO hanfu_product_family VALUES("11","男装2号商品");
INSERT INTO hanfu_product_family VALUES("12","男装3号商品");
INSERT INTO hanfu_product_family VALUES("13","男装4号商品");
INSERT INTO hanfu_product_family VALUES("14","男装5号商品");
INSERT INTO hanfu_product_family VALUES("15","男装6号商品");
INSERT INTO hanfu_product_family VALUES("16","男装7号商品");
INSERT INTO hanfu_product_family VALUES("17","男装8号商品");
INSERT INTO hanfu_product_family VALUES("18","女宝1号商品");
INSERT INTO hanfu_product_family VALUES("19","女宝2号商品");
INSERT INTO hanfu_product_family VALUES("20","女宝3号商品");
INSERT INTO hanfu_product_family VALUES("21","女宝4号商品");
INSERT INTO hanfu_product_family VALUES("22","男宝1号商品");
INSERT INTO hanfu_product_family VALUES("23","男宝2号商品");
INSERT INTO hanfu_product_family VALUES("24","男宝3号商品");
INSERT INTO hanfu_product_family VALUES("25","男宝4号商品");

--#创建商品表 hanfu_product_list
CREATE TABLE hanfu_product_list(
 lid INT PRIMARY KEY AUTO_INCREMENT,  --#商品编号
 family_id INT,                       --#所属家族编号,
 product_id BIGINT,                   --#产品编号
 title VARCHAR(128),                  --#主标题
 notmumber_price DECIMAL(5,2),        --#会员价
 mumber_price DECIMAL(5,2),           --#正常价
 color  varchar(128),                 --#服装颜色
 size1  varchar(3),                   --#服装大小
 size2  varchar(3),                   --#服装大小
 size3  varchar(3),                   --#服装大小
 size4  varchar(3),                   --#服装大小
 size5  varchar(3),                   --#服装大小
 shelf_time  BIGINT,                  --#上架时间
 sold_count  INT,                     --#出售数量
 is_online   BOOL                  --#是否在售 0->否 1->是
);

-- #往 hanfu_product_list（商品列表）中插入数据
-- #女装，不同颜色就是不同商品
-- #1号商品，有四个颜色
-- #粉色
INSERT INTO hanfu_product_list VALUES("1","1","101","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_4.jpg","XS","S","M","L","XL","2019-3-25","2019","1");
-- #浅蓝
INSERT INTO hanfu_product_list VALUES("","1","106","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_5.jpg","XS","S","M","L","XL","2019-3-25","2019","1");
-- #深蓝
INSERT INTO hanfu_product_list VALUES("","1","111","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_6.jpg","XS","S","M","L","XL","2019-3-25","2019","1");
--#天蓝
INSERT INTO hanfu_product_list VALUES("","1","116","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","199","../img/girl1_5(2).jpg","XS","S","M","L","XL","2019-3-25","2019","1");


-- #2号商品,一个颜色
INSERT INTO hanfu_product_list VALUES("","2","121","梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙","298","288","../img/girl2_14.jpg","XS","S","M","L","","2019-3-25","2019","1");

-- #3号商品，两个颜色
-- #粉色
INSERT INTO hanfu_product_list VALUES("","3","126","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #浅蓝色
INSERT INTO hanfu_product_list VALUES("","3","131","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","158","../img/girl3_3.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #4号商品，两个颜色，粉色和深蓝
-- #粉色
INSERT INTO hanfu_product_list VALUES("","4","136","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #蓝色
INSERT INTO hanfu_product_list VALUES("","4","141","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","188","../img/girl5_2.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #5号商品，两个颜色
-- #浅蓝
INSERT INTO hanfu_product_list VALUES("","5","146","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_2.jpg","S","M","L","XL","","2019-3-25","2019","1");

-- #粉色
INSERT INTO hanfu_product_list VALUES("","5","151","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","98","../img/girl8_3.jpg","S","M","L","XL","","2019-3-25","2019","1");

-- #6号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","6","156","初姗古装女仙女汉服超仙改良襦裙广袖流仙裙中国风清新淡雅演出服","396","388","../img/girl9_4.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #7号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","7","161","BOBO Angel原创改良锦鲤古装古风汉服春夏装女中国风襦裙汉元素套装","329","298","../img/girl10_4.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #8号商品，一颜色
INSERT INTO hanfu_product_list VALUES("","8","176","雅帝泽2019新款锦鲤改良汉服女学生汉元素古装襦裙古风日常仙女装","166","109","../img/girl12_1.jpg","S","M","L","XL","","2019-3-25","2019","1");

-- #9号商品，
-- #上红，下米白
INSERT INTO hanfu_product_list VALUES("","9","176","雪花年会女古装明制袄裙秋装女交领汉服改良古筝古风表演襦裙绣花","166","109","../img/girl13_1.jpg","S","M","L","XL","","2019-3-25","2019","1");
-- #上米白，下红
INSERT INTO hanfu_product_list VALUES("","9","176","雪花年会女古装明制袄裙秋装女交领汉服改良古筝古风表演襦裙绣花","166","109","../img/girl13_3.jpg","S","M","L","XL","","2019-3-25","2019","1");
-- #上白，下粉
INSERT INTO hanfu_product_list VALUES("","9","176","雪花年会女古装明制袄裙秋装女交领汉服改良古筝古风表演襦裙绣花","166","109","../img/girl13_5.jpg","S","M","L","XL","","2019-3-25","2019","1");
-- # 上粉，下白
INSERT INTO hanfu_product_list VALUES("","9","176","雪花年会女古装明制袄裙秋装女交领汉服改良古筝古风表演襦裙绣花","166","109","../img/girl13_6.jpg","S","M","L","XL","","2019-3-25","2019","1");

-- #男装,1号商品
-- #白红
INSERT INTO hanfu_product_list VALUES("","10","201","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_2.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");
-- #蓝白
INSERT INTO hanfu_product_list VALUES("","10","206","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","209","../img/boy1_4.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");


-- #男装，2号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","11","211","汉服男装古装长袍原创传统男装绣花大氅汉服氅衣广袖大袖衫非古装外套上衣下裳套装","169","159","../img/boy2_1.jpg","S","M","L","XL","","2019-3-25","2019","1");

-- #男装，3号商品，两个颜色
-- #白色
INSERT INTO hanfu_product_list VALUES("","12","216","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_1.jpg","M","L","XL","XXL","","2019-3-25","2019","1");
-- #蓝色
INSERT INTO hanfu_product_list VALUES("","12","221","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","169","../img/boy3_3.jpg","M","L","XL","XXL","","2019-3-25","2019","1");

-- #男装，4号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","13","226","cos古装男汉唐有梦凤歌鸾汉服男古装汉装古风侠客书生cos服魏晋中国风春秋 黑灰两件套 S","128","98","../img/boy4_3.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");

-- #男装5号商品，两个颜色
-- #浅色
INSERT INTO hanfu_product_list VALUES("","14","231","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_1.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");
-- #青色
INSERT INTO hanfu_product_list VALUES("","14","236","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","98","../img/boy5_5.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");

-- #男装6号商品，两个颜色
-- #黑色
INSERT INTO hanfu_product_list VALUES("","15","241","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_1.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");

-- #米白
INSERT INTO hanfu_product_list VALUES("","15","246","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","198","../img/boy6_7.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");


-- #男装7号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","16","251","汉服男装古装长袍改良男装汉服套装男中国风古装武侠剑客交领襦裙两件套夜行衣班服","228","208","../img/boy7_1.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");


-- #男装8号商品，两个颜色
-- #白色
INSERT INTO hanfu_product_list VALUES("","17","256","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_1.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");
-- #黑色
INSERT INTO hanfu_product_list VALUES("","17","261","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","188","../img/boy8_2.jpg","S","M","L","XL","XXL","2019-3-25","2019","1");


-- #童装，女宝
-- #1号商品，一种颜色
INSERT INTO hanfu_product_list VALUES("","18","301","汉服女装襦裙仙女裙儿童儿童汉服古装刺绣齐胸襦裙女童改良款民族连衣裙春秋季宝宝女唐装","168","98","../img/cg1_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #女宝2号商品，两种颜色
-- #粉色
INSERT INTO hanfu_product_list VALUES("","19","306","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_4.jpg","XS","S","M","L","XL","2019-3-25","2019","1");
-- #粉色
INSERT INTO hanfu_product_list VALUES("","19","311","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","108","../img/cg2_3.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #女宝3号商品,一个颜色
INSERT INTO hanfu_product_list VALUES("","20","316","汉服女装襦裙仙女裙儿童儿童古装汉服仙女公主改良小女孩中国风超仙女童春秋襦裙唐装飘逸","108","98","../img/cg3_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");


-- #女宝4号商品,三个个颜色
-- #玫红色
INSERT INTO hanfu_product_list VALUES("","21","321","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");
-- #浅紫色
INSERT INTO hanfu_product_list VALUES("","21","326","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_2.jpg","XS","S","M","L","XL","2019-3-25","2019","1");
-- #青色
INSERT INTO hanfu_product_list VALUES("","21","331","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","99","../img/cg4_4.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #童装男宝1号商品，两个颜色
-- #浅蓝
INSERT INTO hanfu_product_list VALUES("","22","346","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");
-- #红色
INSERT INTO hanfu_product_list VALUES("","22","351","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","189","../img/cb1_4.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #男宝2号商品。一个颜色
INSERT INTO hanfu_product_list VALUES("","23","356","古装汉服男童国学演出服小学生女童舞蹈服长袖表演服装书童送帽子","169","129","../img/cb2_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");

-- #男宝3号商品，一个颜色
INSERT INTO hanfu_product_list VALUES("","24","361","儿童汉服男古装书童汉服国学小学男开笔礼孔子弟子规演出诵读春秋","139","129","../img/cb3_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");


-- #男宝4号商品，
-- #三个颜色
INSERT INTO hanfu_product_list VALUES("","25","366","宝宝汉服春秋男童古装夏季套装改良周岁中国风复古儿童汉服男唐装","99","89","../img/cb4_1.jpg","XS","S","M","L","XL","2019-3-25","2019","1");



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
 img24_src VARCHAR(128)
);

-- #往hanfu_product_detail表中插数据
-- 女一,现有29张图片，
INSERT INTO hanfu_product_detail VALUES(
  1,
  "../img/girl1_7.jpg",
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
  "",
  "");
-- 女二，现有16张图片，其余14张为空
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl2_6.jpg",
  "../img/girl2_7.jpg",
  "../img/girl2_8.jpg",
  "../img/girl2_9.jpg",
  "../img/girl2_10.jpg",
  "../img/girl2_11.jpg",
  "../img/girl2_12.jpg",
  "../img/girl2_13.jpg",
  "../img/girl2_15.jpg",
  "../img/girl2_16.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "");
-- -- 女三，现有27张图片，其余3张为空
INSERT INTO hanfu_product_detail VALUES(
  "",
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
  "",
  "",
  "",
  "");

-- -- 女四，一共26张图片，其余4个为空
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl5_8.jpg",
  "../img/girl5_7.jpg",
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
  "",
  "",
  "",
  "");
-- 女五，一共29张图片，其余1个为空
INSERT INTO hanfu_product_detail VALUES(
  "",
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
  "../img/girl8_29.jpg");

-- 女六 共有17张图片，其他为空
INSERT INTO hanfu_product_detail VALUES(
  "",
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
  "../img/girl9_17.png",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "");

-- #女七 共25张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl10_6.jpg",
  "../img/girl10_7.jpg",
  "../img/girl10_8.jpg",
  "../img/girl10_9.jpg",
  "../img/girl10_10.jpg",
  "../img/girl10_11.jpg",
  "../img/girl10_12.jpg",
  "../img/girl10_13.jpg",
  "../img/girl10_14.jpg",
  "../img/girl10_15.jpg",
  "../img/girl10_16.jpg",
  "../img/girl10_17.jpg",
  "../img/girl10_18.jpg",
  "../img/girl10_19.jpg",
  "../img/girl10_20.jpg",
  "../img/girl10_21.jpg",
  "../img/girl10_22.jpg",
  "../img/girl10_24.jpg",
  "../img/girl10_25.jpg",
  "",
  "",
  "",
  "",
  "");

-- #女八 共10张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl12_5.jpg",
  "../img/girl12_6.jpg",
  "../img/girl12_7.jpg",
  "../img/girl12_8.jpg",
  "../img/girl12_9.jpg",
  "../img/girl12_10.jpg",
  "../img/girl12_26.jpg",
  "../img/girl12_11.jpg",
  "../img/girl12_12.jpg",
  "../img/girl12_13.jpg",
  "../img/girl12_14.jpg",
  "../img/girl12_15.jpg",
  "../img/girl12_16.jpg",
  "../img/girl12_17.jpg",
  "../img/girl12_18.jpg",
  "../img/girl12_19.jpg",
  "../img/girl12_20.jpg",
  "../img/girl12_21.jpg",
  "../img/girl12_22.jpg",
  "../img/girl12_23.jpg",
  "../img/girl12_24.jpg",
  "../img/girl12_25.jpg",
  "",
  "");

-- #女九 共26张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/girl13_7.jpg",
  "../img/girl13_9.jpg",
  "../img/girl13_10.jpg",
  "../img/girl13_11.jpg",
  "../img/girl13_12.jpg",
  "../img/girl13_13.jpg",
  "../img/girl13_14.jpg",
  "../img/girl13_15.jpg",
  "../img/girl13_16.jpg",
  "../img/girl13_17.jpg",
  "../img/girl13_18.jpg",
  "../img/girl13_19.jpg",
  "../img/girl13_20.jpg",
  "../img/girl13_21.jpg",
  "../img/girl13_22.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "");


--男装 1号，20张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy1_6.jpg",
  "../img/boy1_7.jpg",
  "../img/boy1_8.jpg",
  "../img/boy1_10.jpg",
  "../img/boy1_11.jpg",
  "../img/boy1_13.jpg",
  "../img/boy1_14.jpg",
  "../img/boy1_9.jpg",
  "../img/boy1_15.jpg",
  "../img/boy1_12.jpg",
  "../img/boy1_16.jpg",
  "../img/boy1_17.jpg",
  "../img/boy1_18.jpg",
  "../img/boy1_20.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

-- #男装 2号商品，15张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy2_6.jpg",
  "../img/boy2_7.jpg",
  "../img/boy2_14.jpg",
  "../img/boy2_15.jpg",
  "../img/boy2_8.jpg",
  "../img/boy2_9.jpg",
  "../img/boy2_10.jpg",
  "../img/boy2_11.jpg",
  "../img/boy2_12.jpg",
  "../img/boy2_13.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

-- #男装3号商品，27张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy3_5.jpg",
  "../img/boy3_6.jpg",
  "../img/boy3_7.jpg",
  "../img/boy3_8.jpg",
  "../img/boy3_9.jpg",
  "../img/boy3_10.jpg",
  "../img/boy3_11.jpg",
  "../img/boy3_12.jpg",
  "../img/boy3_13.jpg",
  "../img/boy3_14.jpg",
  "../img/boy3_15.jpg",
  "../img/boy3_16.jpg",
  "../img/boy3_17.jpg",
  "../img/boy3_18.jpg",
  "../img/boy3_19.jpg",
  "../img/boy3_20.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

-- 男装4号商品，20张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy4_6.jpg",
  "../img/boy4_7.jpg",
  "../img/boy4_8.jpg",
  "../img/boy4_9.jpg",
  "../img/boy4_10.jpg",
  "../img/boy4_11.jpg",
  "../img/boy4_12.jpg",
  "../img/boy4_13.jpg",
  "../img/boy4_14.jpg",
  "../img/boy4_15.jpg",
  "../img/boy4_16.jpg",
  "../img/boy4_17.jpg",
  "../img/boy4_18.jpg",
  "../img/boy4_19.jpg",
  "../img/boy4_20.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

-- 男装5号商品，9张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy5_5.jpg",
  "../img/boy5_6.jpg",
  "../img/boy5_7.jpg",
  "../img/boy5_8.jpg",
  "../img/boy5_9.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

-- #男装6号商品，共23张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy6_8.jpg",
  "../img/boy6_9.jpg",
  "../img/boy6_10.jpg",
  "../img/boy6_11.jpg",
  "../img/boy6_12.jpg",
  "../img/boy6_13.jpg",
  "../img/boy6_14.jpg",
  "../img/boy6_15.jpg",
  "../img/boy6_16.jpg",
  "../img/boy6_18.jpg",
  "../img/boy6_19.jpg",
  "../img/boy6_20.jpg",
  "../img/boy6_22.jpg",
  "../img/boy6_23.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

-- #男装7号商品，共26张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy7_5.jpg",
  "../img/boy7_6.jpg",
  "../img/boy7_7.jpg",
  "../img/boy7_8.jpg",
  "../img/boy7_9.jpg",
  "../img/boy7_10.jpg",
  "../img/boy7_11.jpg",
  "../img/boy7_12.jpg",
  "../img/boy7_13.jpg",
  "../img/boy7_14.jpg",
  "../img/boy7_15.jpg",
  "../img/boy7_16.jpg",
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
  "",
  ""); 

-- #男装8号商品，共24张图片
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/boy8_5.jpg",
  "../img/boy8_6.jpg",
  "../img/boy8_7.jpg",
  "../img/boy8_8.jpg",
  "../img/boy8_9.jpg",
  "../img/boy8_10.jpg",
  "../img/boy8_11.jpg",
  "../img/boy8_12.jpg",
  "../img/boy8_13.jpg",
  "../img/boy8_14.jpg",
  "../img/boy8_15.jpg",
  "../img/boy8_16.jpg",
  "../img/boy8_17.jpg",
  "../img/boy8_18.jpg",
  "../img/boy8_19.jpg",
  "../img/boy8_20.jpg",
  "../img/boy8_21.jpg",
  "../img/boy8_22.jpg",
  "../img/boy8_23.jpg",
  "../img/boy8_24.jpg",
  "",
  "",
  "",
  ""); 

-- #女宝一
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cg1_5.jpg",
  "../img/cg1_6.jpg",
  "../img/cg1_7.jpg",
  "../img/cg1_8.jpg",
  "../img/cg1_9.jpg",
  "../img/cg1_10.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "");

-- #女宝二
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cg2_6.jpg",
  "../img/cg2_7.jpg",
  "../img/cg2_8.jpg",
  "../img/cg2_9.jpg",
  "../img/cg2_10.jpg",
  "../img/cg2_11.jpg",
  "../img/cg2_12.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "");

  -- #女宝三
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cg3_5.jpg",
  "../img/cg3_6.jpg",
  "../img/cg3_7.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "");

    -- #女宝四
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cg4_6.jpg",
  "../img/cg4_7.jpg",
  "../img/cg4_8.jpg",
  "../img/cg4_9.jpg",
  "../img/cg4_10.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "");

-- #男宝一
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cb1_5.jpg",
  "../img/cb1_6.png",
  "../img/cb1_7.png",
  "../img/cb1_8.jpg",
  "../img/cb1_9.png",
  "../img/cb1_10.png",
  "../img/cb1_11.png",
  "../img/cb1_12.png",
  "../img/cb1_13.png",
  "../img/cb1_14.png",
  "../img/cb1_15.png",
  "../img/cb1_16.png",
  "../img/cb1_17.png",
  "../img/cb1_18.png",
  "../img/cb1_19.png",
  "../img/cb1_20.png",
  "../img/cb1_21.png",
  "../img/cb1_22.jpg",
  "",
  "",
  "",
  "",
  "",
  ""); 

  -- #男宝二
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cb2_5.jpg",
  "../img/cb2_6.jpg",
  "../img/cb2_7.jpg",
  "../img/cb2_8.jpg",
  "../img/cb2_9.jpg",
  "../img/cb2_10.jpg",
  "../img/cb2_11.jpg",
  "../img/cb2_12.jpg",
  "../img/cb2_13.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

  -- #男宝二
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cb3_5.jpg",
  "../img/cb3_6.jpg",
  "../img/cb3_7.jpg",
  "../img/cb3_8.jpg",
  "../img/cb3_9.jpg",
  "../img/cb3_10.jpg",
  "../img/cb3_11.jpg",
  "../img/cb3_12.jpg",
  "../img/cb3_13.jpg",
  "../img/cb3_14.jpg",
  "../img/cb3_15.jpg",
  "../img/cb3_16.jpg",
  "../img/cb3_17.jpg",
  "../img/cb3_18.jpg",
  "../img/cb3_19.jpg",
  "../img/cb3_20.jpg",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""); 

    -- #男宝四
INSERT INTO hanfu_product_detail VALUES(
  "",
  "../img/cb4_6.jpg",
  "../img/cb4_7.jpg",
  "../img/cb4_8.jpg",
  "../img/cb4_9.jpg",
  "../img/cb4_10.jpg",
  "../img/cb4_11.jpg",
  "../img/cb4_12.jpg",
  "../img/cb4_13.jpg",
  "../img/cb4_14.jpg",
  "../img/cb4_15.jpg",
  "../img/cb4_16.jpg",
  "../img/cb4_17.jpg",
  "../img/cb4_18.jpg",
  "../img/cb4_19.jpg",
  "../img/cb4_20.jpg",
  "../img/cb4_21.jpg",
  "../img/cb4_22.jpg",
  "../img/cb4_23.jpg",
  "../img/cb4_24.jpg",
  "../img/cb4_25.jpg",
  "",
  "",
  "",
  ""); 
-- #商品详情页大图表格big_img
CREATE TABLE big_img(
pid INT PRIMARY KEY  AUTO_INCREMENT,
family_id INT,
small VARCHAR(320),   --#小图片路径
big VARCHAR(320)   --#小图片路径
);

-- #详情页的小图和大图
-- #女装一
INSERT INTO big_img VALUES(1,1,"../big_img/girl1_small1.jpg","../big_img/girl1_big1.jpg");
INSERT INTO big_img VALUES(null,1,"../big_img/girl1_small2.jpg","../big_img/girl1_big2.jpg");
INSERT INTO big_img VALUES(null,1,"../big_img/girl1_small3.jpg","../big_img/girl1_big3.jpg");
INSERT INTO big_img VALUES(null,1,"../big_img/girl1_small4.jpg","../big_img/girl1_big4.jpg");

-- #女装二
INSERT INTO big_img VALUES(null,2,"../big_img/girl2_small1.jpg","../big_img/girl2_big1.jpg");
INSERT INTO big_img VALUES(null,2,"../big_img/girl2_small2.jpg","../big_img/girl2_big2.jpg");
INSERT INTO big_img VALUES(null,2,"../big_img/girl2_small3.jpg","../big_img/girl2_big3.jpg");
INSERT INTO big_img VALUES(null,2,"../big_img/girl2_small4.jpg","../big_img/girl2_big4.jpg");

-- #女装三
INSERT INTO big_img VALUES(null,3,"../big_img/girl3_small1.jpg","../big_img/girl3_big1.jpg");
INSERT INTO big_img VALUES(null,3,"../big_img/girl3_small2.jpg","../big_img/girl3_big2.jpg");
INSERT INTO big_img VALUES(null,3,"../big_img/girl3_small3.jpg","../big_img/girl3_big3.jpg");
INSERT INTO big_img VALUES(null,3,"../big_img/girl3_small4.jpg","../big_img/girl3_big4.jpg");

-- #女装四
INSERT INTO big_img VALUES(null,4,"../big_img/girl5_small1.jpg","../big_img/girl5_big1.jpg");
INSERT INTO big_img VALUES(null,4,"../big_img/girl5_small2.jpg","../big_img/girl5_big2.jpg");
INSERT INTO big_img VALUES(null,4,"../big_img/girl5_small3.jpg","../big_img/girl5_big3.jpg");
INSERT INTO big_img VALUES(null,4,"../big_img/girl5_small4.jpg","../big_img/girl5_big4.jpg");

-- #女装五
INSERT INTO big_img VALUES(null,5,"../big_img/girl8_small1.jpg","../big_img/girl8_big1.jpg");
INSERT INTO big_img VALUES(null,5,"../big_img/girl8_small2.jpg","../big_img/girl8_big2.jpg");
INSERT INTO big_img VALUES(null,5,"../big_img/girl8_small3.jpg","../big_img/girl8_big3.jpg");
INSERT INTO big_img VALUES(null,5,"../big_img/girl8_small4.jpg","../big_img/girl8_big4.jpg");

-- #女装六
INSERT INTO big_img VALUES(null,6,"../big_img/girl9_small1.jpg","../big_img/girl9_big1.jpg");
INSERT INTO big_img VALUES(null,6,"../big_img/girl9_small2.jpg","../big_img/girl9_big2.jpg");
INSERT INTO big_img VALUES(null,6,"../big_img/girl9_small3.jpg","../big_img/girl9_big3.jpg");
INSERT INTO big_img VALUES(null,6,"../big_img/girl9_small4.jpg","../big_img/girl9_big4.jpg");

-- #女装七
INSERT INTO big_img VALUES(null,7,"../big_img/girl10_small1.jpg","../big_img/girl10_big1.jpg");
INSERT INTO big_img VALUES(null,7,"../big_img/girl10_small2.jpg","../big_img/girl10_big2.jpg");
INSERT INTO big_img VALUES(null,7,"../big_img/girl10_small3.jpg","../big_img/girl10_big3.jpg");
INSERT INTO big_img VALUES(null,7,"../big_img/girl10_small4.jpg","../big_img/girl10_big4.jpg");

-- #女装八
INSERT INTO big_img VALUES(null,8,"../big_img/girl12_small1.jpg","../big_img/girl12_big1.jpg");
INSERT INTO big_img VALUES(null,8,"../big_img/girl12_small2.jpg","../big_img/girl12_big2.jpg");
INSERT INTO big_img VALUES(null,8,"../big_img/girl12_small3.jpg","../big_img/girl12_big3.jpg");
INSERT INTO big_img VALUES(null,8,"../big_img/girl12_small4.jpg","../big_img/girl12_big4.jpg");

-- #女装九
INSERT INTO big_img VALUES(null,9,"../big_img/girl13_small1.jpg","../big_img/girl13_big1.jpg");
INSERT INTO big_img VALUES(null,9,"../big_img/girl13_small2.jpg","../big_img/girl13_big2.jpg");
INSERT INTO big_img VALUES(null,9,"../big_img/girl13_small3.jpg","../big_img/girl13_big3.jpg");
INSERT INTO big_img VALUES(null,9,"../big_img/girl13_small4.jpg","../big_img/girl13_big4.jpg");

-- #男装一
INSERT INTO big_img VALUES(null,10,"../big_img/boy1_small1.jpg","../big_img/boy1_big1.jpg");
INSERT INTO big_img VALUES(null,10,"../big_img/boy1_small2.jpg","../big_img/boy1_big2.jpg");
INSERT INTO big_img VALUES(null,10,"../big_img/boy1_small3.jpg","../big_img/boy1_big3.jpg");
INSERT INTO big_img VALUES(null,10,"../big_img/boy1_small4.jpg","../big_img/boy1_big4.jpg");

-- #男装二
INSERT INTO big_img VALUES(null,11,"../big_img/boy2_small1.jpg","../big_img/boy2_big1.jpg");
INSERT INTO big_img VALUES(null,11,"../big_img/boy2_small2.jpg","../big_img/boy2_big2.jpg");
INSERT INTO big_img VALUES(null,11,"../big_img/boy2_small3.jpg","../big_img/boy2_big3.jpg");
INSERT INTO big_img VALUES(null,11,"../big_img/boy2_small4.jpg","../big_img/boy2_big4.jpg");

-- #男装三
INSERT INTO big_img VALUES(null,12,"../big_img/boy3_small1.jpg","../big_img/boy3_big1.jpg");
INSERT INTO big_img VALUES(null,12,"../big_img/boy3_small2.jpg","../big_img/boy3_big2.jpg");
INSERT INTO big_img VALUES(null,12,"../big_img/boy3_small3.jpg","../big_img/boy3_big3.jpg");
INSERT INTO big_img VALUES(null,12,"../big_img/boy3_small4.jpg","../big_img/boy3_big4.jpg");

-- #男装四
INSERT INTO big_img VALUES(null,13,"../big_img/boy4_small1.jpg","../big_img/boy4_big1.jpg");
INSERT INTO big_img VALUES(null,13,"../big_img/boy4_small2.jpg","../big_img/boy4_big2.jpg");
INSERT INTO big_img VALUES(null,13,"../big_img/boy4_small3.jpg","../big_img/boy4_big3.jpg");
INSERT INTO big_img VALUES(null,13,"../big_img/boy4_small4.jpg","../big_img/boy4_big4.jpg");

-- #男装五
INSERT INTO big_img VALUES(null,14,"../big_img/boy5_small1.jpg","../big_img/boy5_big1.jpg");
INSERT INTO big_img VALUES(null,14,"../big_img/boy5_small2.jpg","../big_img/boy5_big2.jpg");
INSERT INTO big_img VALUES(null,14,"../big_img/boy5_small3.jpg","../big_img/boy5_big3.jpg");
INSERT INTO big_img VALUES(null,14,"../big_img/boy5_small4.jpg","../big_img/boy5_big4.jpg");

-- #男装六
INSERT INTO big_img VALUES(null,15,"../big_img/boy6_small1.jpg","../big_img/boy6_big1.jpg");
INSERT INTO big_img VALUES(null,15,"../big_img/boy6_small2.jpg","../big_img/boy6_big2.jpg");
INSERT INTO big_img VALUES(null,15,"../big_img/boy6_small3.jpg","../big_img/boy6_big3.jpg");
INSERT INTO big_img VALUES(null,15,"../big_img/boy6_small4.jpg","../big_img/boy6_big4.jpg");

-- #男装七
INSERT INTO big_img VALUES(null,16,"../big_img/boy7_small1.jpg","../big_img/boy7_big1.jpg");
INSERT INTO big_img VALUES(null,16,"../big_img/boy7_small2.jpg","../big_img/boy7_big2.jpg");
INSERT INTO big_img VALUES(null,16,"../big_img/boy7_small3.jpg","../big_img/boy7_big3.jpg");
INSERT INTO big_img VALUES(null,16,"../big_img/boy7_small4.jpg","../big_img/boy7_big4.jpg");

-- #男装八
INSERT INTO big_img VALUES(null,17,"../big_img/boy8_small1.jpg","../big_img/boy8_big1.jpg");
INSERT INTO big_img VALUES(null,17,"../big_img/boy8_small2.jpg","../big_img/boy8_big2.jpg");
INSERT INTO big_img VALUES(null,17,"../big_img/boy8_small3.jpg","../big_img/boy8_big3.jpg");
INSERT INTO big_img VALUES(null,17,"../big_img/boy8_small4.jpg","../big_img/boy8_big4.jpg");

-- #女宝一
INSERT INTO big_img VALUES(null,18,"../big_img/cg1_small1.jpg","../big_img/cg1_big1.jpg");
INSERT INTO big_img VALUES(null,18,"../big_img/cg1_small2.jpg","../big_img/cg1_big2.jpg");
INSERT INTO big_img VALUES(null,18,"../big_img/cg1_small3.jpg","../big_img/cg1_big3.jpg");
INSERT INTO big_img VALUES(null,18,"../big_img/cg1_small4.jpg","../big_img/cg1_big4.jpg");

-- #女宝二
INSERT INTO big_img VALUES(null,19,"../big_img/cg2_small1.jpg","../big_img/cg2_big1.jpg");
INSERT INTO big_img VALUES(null,19,"../big_img/cg2_small2.jpg","../big_img/cg2_big2.jpg");
INSERT INTO big_img VALUES(null,19,"../big_img/cg2_small3.jpg","../big_img/cg2_big3.jpg");
INSERT INTO big_img VALUES(null,19,"../big_img/cg2_small4.jpg","../big_img/cg2_big4.jpg");

-- #女宝三
INSERT INTO big_img VALUES(null,20,"../big_img/cg3_small1.jpg","../big_img/cg3_big1.jpg");
INSERT INTO big_img VALUES(null,20,"../big_img/cg3_small2.jpg","../big_img/cg3_big2.jpg");
INSERT INTO big_img VALUES(null,20,"../big_img/cg3_small3.jpg","../big_img/cg3_big3.jpg");
INSERT INTO big_img VALUES(null,20,"../big_img/cg3_small4.jpg","../big_img/cg3_big4.jpg");

-- #女宝四
INSERT INTO big_img VALUES(null,21,"../big_img/cg4_small1.jpg","../big_img/cg4_big1.jpg");
INSERT INTO big_img VALUES(null,21,"../big_img/cg4_small2.jpg","../big_img/cg4_big2.jpg");
INSERT INTO big_img VALUES(null,21,"../big_img/cg4_small3.jpg","../big_img/cg4_big3.jpg");
INSERT INTO big_img VALUES(null,21,"../big_img/cg4_small4.jpg","../big_img/cg4_big4.jpg");

-- #男宝一
INSERT INTO big_img VALUES(null,22,"../big_img/cb1_small1.jpg","../big_img/cb1_big1.jpg");
INSERT INTO big_img VALUES(null,22,"../big_img/cb1_small2.jpg","../big_img/cb1_big2.jpg");
INSERT INTO big_img VALUES(null,22,"../big_img/cb1_small3.jpg","../big_img/cb1_big3.jpg");
INSERT INTO big_img VALUES(null,22,"../big_img/cb1_small4.jpg","../big_img/cb1_big4.jpg");

-- #男宝二
INSERT INTO big_img VALUES(null,23,"../big_img/cb2_small1.jpg","../big_img/cb2_big1.jpg");
INSERT INTO big_img VALUES(null,23,"../big_img/cb2_small2.jpg","../big_img/cb2_big2.jpg");
INSERT INTO big_img VALUES(null,23,"../big_img/cb2_small3.jpg","../big_img/cb2_big3.jpg");
INSERT INTO big_img VALUES(null,23,"../big_img/cb2_small4.jpg","../big_img/cb2_big4.jpg");

-- #男宝三
INSERT INTO big_img VALUES(null,24,"../big_img/cb3_small1.jpg","../big_img/cb3_big1.jpg");
INSERT INTO big_img VALUES(null,24,"../big_img/cb3_small2.jpg","../big_img/cb3_big2.jpg");
INSERT INTO big_img VALUES(null,24,"../big_img/cb3_small3.jpg","../big_img/cb3_big3.jpg");
INSERT INTO big_img VALUES(null,24,"../big_img/cb3_small4.jpg","../big_img/cb3_big4.jpg");

-- #男宝四
INSERT INTO big_img VALUES(null,25,"../big_img/cb4_small1.jpg","../big_img/cb4_big1.jpg");
INSERT INTO big_img VALUES(null,25,"../big_img/cb4_small2.jpg","../big_img/cb4_big2.jpg");
INSERT INTO big_img VALUES(null,25,"../big_img/cb4_small3.jpg","../big_img/cb4_big3.jpg");
INSERT INTO big_img VALUES(null,25,"../big_img/cb4_small4.jpg","../big_img/cb4_big4.jpg");

-- #轮播图广告商品
CREATE TABLE hanfu_index_carousel(
cid INT PRIMARY KEY  AUTO_INCREMENT,
src  VARCHAR(320),          --#图片路径
title VARCHAR(128),         --#图片标题
herf  VARCHAR(320)          --#图片跳转
);

--#往hanfu_index_carouse里添加数据
INSERT INTO hanfu_index_carousel VALUES(1,"../img_lunbo/top_lunbo1_4.jpg","l首页轮播广告商品1","");
INSERT INTO hanfu_index_carousel VALUES("","../img_lunbo/top_lunbo1_1.jpg","l首页轮播广告商品2","");
INSERT INTO hanfu_index_carousel VALUES("","../img_lunbo/top_lunbo1_2.jpg","l首页轮播广告商品3","");
INSERT INTO hanfu_index_carousel VALUES("","../img_lunbo/top_lunbo1_3.jpg","l首页轮播广告商品4","");
INSERT INTO hanfu_index_carousel VALUES("","../img_lunbo/top_lunbo1_4.jpg","l首页轮播广告商品1","");

--#创建首页列表hanfu_index_product
CREATE TABLE hanfu_index_product(
fid INT PRIMARY KEY  AUTO_INCREMENT,--#商品编号
family_id VARCHAR(128),      --#家族编号
product_id VARCHAR(128),      --#产品编号
detail VARCHAR(128),         --#商品详情
price  VARCHAR(320),         --#商品单价
dSrc  VARCHAR(320)        --#商品图片
);

-- #往首页商品列表中插入数据
-- #女装
INSERT INTO hanfu_index_product VALUES("1","1","101","染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常","399","../img/girl1_4.jpg");
INSERT INTO hanfu_index_product VALUES("","2","121","梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙","288","../img/girl2_14.jpg");
INSERT INTO hanfu_index_product VALUES("","3","126","鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风","188","../img/girl3_1.jpg");
INSERT INTO hanfu_index_product VALUES("","4","136","汉服女古装仙女中国风飘逸清新淡雅改良古风日常装襦裙套装演出服","208","../img/girl5_1.jpg");
INSERT INTO hanfu_index_product VALUES("","5","146","仙女2019春季女装文艺复古绣花高腰中袖长款连衣裙九分袖汉服","108","../img/girl8_2.jpg");
INSERT INTO hanfu_index_product VALUES("","6","156","初姗古装女仙女汉服超仙改良襦裙广袖流仙裙中国风清新淡雅演出服","396","../img/girl9_4.jpg");
INSERT INTO hanfu_index_product VALUES("","7","161","BOBO Angel原创改良锦鲤古装古风汉服春夏装女中国风襦裙汉元素套装","329","../img/girl10_4.jpg");
INSERT INTO hanfu_index_product VALUES("","8","176","雅帝泽2019新款锦鲤改良汉服女学生汉元素古装襦裙古风日常仙女装","166","../img/girl12_1.jpg");
INSERT INTO hanfu_index_product VALUES("","9","166","雪花年会女古装明制袄裙秋装女交领汉服改良古筝古风表演襦裙绣花","199","../img/girl13_1.jpg");
-- #男装
INSERT INTO hanfu_index_product VALUES("","10","201","汉服男装古装长袍重回容止改良日常汉服古装大氅长袍男绣花古风交领上衣大袖衫仙气汉服圈","269","../img/boy1_2.jpg");
INSERT INTO hanfu_index_product VALUES("","11","211","汉服男装古装长袍原创传统男装绣花大氅汉服氅衣广袖大袖衫非古装外套上衣下裳套装","169","../img/boy2_1.jpg");
INSERT INTO hanfu_index_product VALUES("","12","216","汉风华裳中国风云纹绣花大氅改良汉服男士古装汉装大袖衫秋冬套装","188","../img/boy3_1.jpg");
INSERT INTO hanfu_index_product VALUES("","13","226","cos古装男汉唐有梦凤歌鸾汉服男古装汉装古风侠客书生cos服魏晋中国风春秋 黑灰两件套 S","128","../img/boy4_3.jpg");
INSERT INTO hanfu_index_product VALUES("","14","231","汉服男装古装长袍改良汉服男古风古装汉装侠客书生cos服公子帅气男士仙气春装汉服圈","128","../img/boy5_1.jpg");
INSERT INTO hanfu_index_product VALUES("","15","241","汉服男装古装长袍春秋男装大码汉服男魏晋风儒雅气度大氅大袖衫交领齐腰襦裙套装","268","../img/boy6_1.jpg");
INSERT INTO hanfu_index_product VALUES("","16","251","汉服男装古装长袍改良男装汉服套装男中国风古装武侠剑客交领襦裙两件套夜行衣班服","228","../img/boy7_1.jpg");
INSERT INTO hanfu_index_product VALUES("","17","256","汉服男装古装长袍中国风刺绣交领汉服男古装班服CP装武侠书生男装表演套装班服团服","218","../img/boy8_1.jpg");

-- #女宝
INSERT INTO hanfu_index_product VALUES("","18","301","汉服女装襦裙仙女裙儿童儿童汉服古装刺绣齐胸襦裙女童改良款民族连衣裙春秋季宝宝女唐装","168","../img/cg1_1.jpg");
INSERT INTO hanfu_index_product VALUES("","19","306","巴斯贝塔 女童汉服连衣裙复古童装2019新款宝宝中国风唐装古装襦裙儿童民族风连衣裙","158","../img/cg2_4.jpg");
INSERT INTO hanfu_index_product VALUES("","20","316","汉服女装襦裙仙女裙儿童儿童古装汉服仙女公主改良小女孩中国风超仙女童春秋襦裙唐装飘逸","108","../img/cg3_1.jpg");
INSERT INTO hanfu_index_product VALUES("","21","321","儿童古装民国学生装套装汉服童装女童五四朗诵合唱古筝演出服班服","128","../img/cg4_1.jpg");

-- #男宝
INSERT INTO hanfu_index_product VALUES("","22","346","男童春装儿童古装汉服男孩襦裙儿童汉服男小孩中国风演出服幼儿园 精美刺绣 四季适宜","199","../img/cb1_1.jpg");
INSERT INTO hanfu_index_product VALUES("","23","356","古装汉服男童国学演出服小学生女童舞蹈服长袖表演服装书童送帽子","169","../img/cb2_1.jpg");
INSERT INTO hanfu_index_product VALUES("","24","361","儿童汉服男古装书童汉服国学小学男开笔礼孔子弟子规演出诵读春秋","139","../img/cb3_1.jpg");
INSERT INTO hanfu_index_product VALUES("","25","366","宝宝汉服春秋男童古装夏季套装改良周岁中国风复古儿童汉服男唐装","99","../img/cb4_1.jpg")