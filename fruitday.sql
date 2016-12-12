CREATE DATABASE fruitday CHARACTER SET=UTF8;
USE fruitday;
#分类表
CREATE TABLE class
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
INSERT INTO class SET name="调味配菜";
INSERT INTO class SET name="虾蟹";
INSERT INTO class SET name="贝类";
INSERT INTO class SET name="禽蛋";
INSERT INTO class SET name="水产、鱼类";
INSERT INTO class SET name="即食刺身";
INSERT INTO class SET name="根茎类";
INSERT INTO class SET name="茄蔬类";
INSERT INTO class SET name="瓜果类";
INSERT INTO class SET name="冷冻面点";
INSERT INTO class SET name="面包甜点";
INSERT INTO class SET name="方便速食";
INSERT INTO class SET name="牛肉";
INSERT INTO class SET name="羊肉";
INSERT INTO class SET name="猪肉";
INSERT INTO class SET name="和牛";
INSERT INTO class SET name="菌菇类";
INSERT INTO class SET name="豆类";
INSERT INTO class SET name="牛奶";
INSERT INTO class SET name="坚果类";
#产地表
CREATE TABLE origin
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
INSERT INTO origin SET name="中国";
INSERT INTO origin SET name="美国";
INSERT INTO origin SET name="智利";
INSERT INTO origin SET name="泰国";
INSERT INTO origin SET name="西班牙";
INSERT INTO origin SET name="新西兰";
INSERT INTO origin SET name="意大利";
INSERT INTO origin SET name="越南";
INSERT INTO origin SET name="马来西亚";
INSERT INTO origin SET name="澳大利亚";
INSERT INTO origin SET name="荷兰";
INSERT INTO origin SET name="阿根廷";
INSERT INTO origin SET name="朝鲜";
INSERT INTO origin SET name="法国";
INSERT INTO origin SET name="加拿大";
INSERT INTO origin SET name="土耳其";
INSERT INTO origin SET name="乌拉圭";
INSERT INTO origin SET name="英国";
INSERT INTO origin SET name="巴西";
INSERT INTO origin SET name="其它";
#规格表
CREATE TABLE standard
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
INSERT INTO standard SET name="单品";
INSERT INTO standard SET name="套餐";
INSERT INTO standard SET name="礼盒";
INSERT INTO standard SET name="礼篮";
INSERT INTO standard SET name="券卡";
#场合表
CREATE TABLE occasion
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
INSERT INTO occasion SET name="生日快乐"; 
INSERT INTO occasion SET name="早日康复"; 
INSERT INTO occasion SET name="走亲访友";
#品类表
CREATE TABLE type
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
INSERT INTO type SET name="水果礼篮";
INSERT INTO type SET name="充值券卡";
INSERT INTO type SET name="水果礼盒";
INSERT INTO type SET name="组合套餐";
INSERT INTO type SET name="榴莲";
INSERT INTO type SET name="奇异果";
INSERT INTO type SET name="蓝莓";
INSERT INTO type SET name="枣";
INSERT INTO type SET name="苹果";
INSERT INTO type SET name="椰子";
INSERT INTO type SET name="草莓";
INSERT INTO type SET name="橙子";
INSERT INTO type SET name="香蕉";
INSERT INTO type SET name="释迦";
INSERT INTO type SET name="山竹";
INSERT INTO type SET name="梨";
INSERT INTO type SET name="桔子";
INSERT INTO type SET name="火龙果";
INSERT INTO type SET name="百香果";
INSERT INTO type SET name="葡萄提子";
INSERT INTO type SET name="龙眼";
INSERT INTO type SET name="柚子";
INSERT INTO type SET name="牛油果";
INSERT INTO type SET name="柠檬";
INSERT INTO type SET name="凤梨";
INSERT INTO type SET name="芒果";
INSERT INTO type SET name="杏子李子";
INSERT INTO type SET name="番茄";
INSERT INTO type SET name="葡萄柚";
INSERT INTO type SET name="桃子";
INSERT INTO type SET name="樱桃";
INSERT INTO type SET name="枇杷";
#礼品表
CREATE TABLE gift
(
id INT AUTO_INCREMENT PRIMARY KEY, #礼品id
name VARCHAR(50) NOT NULL,#礼品名字
imagepath VARCHAR(1000) NULL,#礼品图片地址
occasionid INT NOT NULL DEFAULT 1,#场合id
standardid INT NOT NULL DEFAULT 1,#规格id
price INT NOT NULL,#价格
annotation VARCHAR(50) NULL,#礼品注释(左上角)
unit VARCHAR(50) NOT NULL,#礼品单位
foreign key (occasionid) references occasion(id),
foreign key (standardid) references standard(id)
);
CREATE TABLE fresh
(
id INT AUTO_INCREMENT PRIMARY KEY, #生鲜id
name VARCHAR(50) NOT NULL,#生鲜名字
imagepath VARCHAR(1000) NULL,#生鲜图片地址
classid INT NOT NULL,#分类id
originid INT NOT NULL DEFAULT 1,#产地id
standardid INT NOT NULL DEFAULT 1,#规格id
price INT NOT NULL,#价格
annotation VARCHAR(50) NULL,#生鲜注释(左上角)
unit VARCHAR(50) NOT NULL,#生鲜单位
foreign key (classid) references class(id),
foreign key (originid) references origin(id),
foreign key (standardid) references standard(id)
);
CREATE TABLE fruit
(
id INT AUTO_INCREMENT PRIMARY KEY, #鲜果id
name VARCHAR(50) NOT NULL,#鲜果名字
imagepath VARCHAR(1000) NULL,#鲜果图片地址
typeid INT NOT NULL,#品类id
originid INT NOT NULL DEFAULT 1,#产地id
standardid INT NOT NULL DEFAULT 1,#规格id
price INT NOT NULL,#价格
annotation VARCHAR(50) NULL,#鲜果注释(左上角)
unit VARCHAR(50) NOT NULL,#鲜果单位
foreign key (typeid) references type(id),
foreign key (originid) references origin(id),
foreign key (standardid) references standard(id)
);
