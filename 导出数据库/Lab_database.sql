CREATE TABLE 仓库 (
    仓库号 VARCHAR(50) PRIMARY KEY,
    城市 VARCHAR(50),
    面积 INT
);


INSERT INTO 仓库 (仓库号, 城市, 面积) VALUES ('WH1', '北京', 370);
INSERT INTO 仓库 (仓库号, 城市, 面积) VALUES ('WH2', '上海', 500);
INSERT INTO 仓库 (仓库号, 城市, 面积) VALUES ('WH3', '广州', 200);
INSERT INTO 仓库 (仓库号, 城市, 面积) VALUES ('WH4', '武汉', 400);

CREATE TABLE 供应商 (
    供应商号 VARCHAR(50) PRIMARY KEY,
    供应商名 VARCHAR(50),
    地址 VARCHAR(50)
);


INSERT INTO 供应商 (供应商号, 供应商名, 地址) VALUES ('S3', '振华电子厂', '西安');
INSERT INTO 供应商 (供应商号, 供应商名, 地址) VALUES ('S4', '华通电子公司', '北京');
INSERT INTO 供应商 (供应商号, 供应商名, 地址) VALUES ('S6', '607厂', '郑州');
INSERT INTO 供应商 (供应商号, 供应商名, 地址) VALUES ('S7', '爱华电子厂', '北京');

CREATE TABLE 职工 (
    职工号 VARCHAR(50) PRIMARY KEY,
    仓库号 VARCHAR(50),
    工资 INT,
    FOREIGN KEY (仓库号) REFERENCES 仓库(仓库号)
);


INSERT INTO 职工 (职工号, 仓库号, 工资) VALUES ('E1', 'WH2', 1220);
INSERT INTO 职工 (职工号, 仓库号, 工资) VALUES ('E3', 'WH1', 1210);
INSERT INTO 职工 (职工号, 仓库号, 工资) VALUES ('E4', 'WH2', 1250);
INSERT INTO 职工 (职工号, 仓库号, 工资) VALUES ('E6', 'WH3', 1230);
INSERT INTO 职工 (职工号, 仓库号, 工资) VALUES ('E7', 'WH1', 1250);

CREATE TABLE 订购单 (
    订购单号 VARCHAR(50) PRIMARY KEY,
    供应商号 VARCHAR(50),
    职工号 VARCHAR(50),
    订购日期 DATETIME,
    FOREIGN KEY (职工号) REFERENCES 职工(职工号),
    FOREIGN KEY (供应商号) REFERENCES 供应商(供应商号)
);


INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R67', 'S7', 'E3', '2002-06-23');
INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R73', 'S4', 'E1', '2002-07-28');
INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R76', 'S4', 'E7', '2002-05-25');
INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R77', NULL, 'E6', NULL);
INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R79', 'S4', 'E3', '2002-06-13');
INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R80', NULL, 'E1', NULL);
INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R90', NULL, 'E3', NULL);
INSERT INTO 订购单 (订购单号, 供应商号, 职工号, 订购日期) VALUES ('0R91', 'S3', 'E3', '2002-07-13');
