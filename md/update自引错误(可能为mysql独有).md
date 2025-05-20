mysql> UPDATE 职工
    -> SET 工资 = 工资 * 1.05
    -> WHERE 工资 < (SELECT AVG(工资) FROM 职工);
ERROR 1093 (HY000): You can't specify target table '职工' for update in FROM clause

这种也不行
MySQL UPDATE 语句中使用子查询的限制及解决方案
您遇到的错误是 MySQL 的一个特定限制，当您尝试在 UPDATE 语句的 WHERE 子句中直接引用正在更新的表时会出现这个错误。

错误原因详解
MySQL 不允许在 UPDATE/DELETE 语句的子查询中直接引用正在被修改的主表。这是为了防止数据一致性问题而设置的限制。

解决方案
以下是几种可行的解决方法：

方法1：使用派生表（临时表）
sql
UPDATE 职工
SET 工资 = 工资 * 1.05
WHERE 工资 < (SELECT * FROM (
    SELECT AVG(工资) FROM 职工
) AS temp);
方法2：使用用户变量
sql
SET @avg_salary = (SELECT AVG(工资) FROM 职工);
UPDATE 职工
SET 工资 = 工资 * 1.05
WHERE 工资 < @avg_salary;
方法3：使用 JOIN 语法（MySQL特有）
sql
UPDATE 职工 e1
JOIN (SELECT AVG(工资) AS avg_salary FROM 职工) e2
SET e1.工资 = e1.工资 * 1.05
WHERE e1.工资 < e2.avg_salary;
方法4：使用多表更新语法
sql
UPDATE 职工 e1, (SELECT AVG(工资) AS avg_salary FROM 职工) e2
SET e1.工资 = e1.工资 * 1.05
WHERE e1.工资 < e2.avg_salary;
为什么这些方法可行？
这些方法都通过以下方式避免了直接自引用：

创建临时表/派生表存储中间结果

使用变量存储平均值

通过JOIN引入计算好的平均值