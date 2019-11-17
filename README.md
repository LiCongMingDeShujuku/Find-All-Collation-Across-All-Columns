![CLEVER DATA GIT REPO](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/0-clever-data-github.png "李聪明的数据库")

# 查找所有列的所有排序规则
#### Find All Collation Across All Columns
**发布-日期: 2015年04月08日 (评论)**

## Contents

- [中文](#中文)
- [English](#English)
- [SQL Logic](#Logic)
- [Build Info](#Build-Info)
- [Author](#Author)
- [License](#License) 


## 中文
使用以下这段SQL逻辑（logic）在所有表中查找列排序规则。

你遇到过这种错误么？因为由于添加运算符中“Latin1_General_CI_AS”和“SQL_Latin1_General_CP1_CI_AS”之间的排序规则冲突，值的排序规则未解析，所以varchar值到varchar的隐式转换无法执行。

你可能会在某些查询中发现排序规则问题，尤其是在涉及联接时。 你可以通过简单地调整查询，让其包含足够的COLLATION“MyServerCollation”来解决这个问题，但这当然只能影响到当前的查询。 问题仍然存在，有多少个表中的列存在着各种不同的排序规则问题呢？都是哪些列？

此SQL逻辑（logic）将会给你答案。


## English
Find the column collation across all tables with this piece of SQL logic.

Do you have this error? Implicit conversion of varchar value to varchar cannot be performed because the collation of the value is unresolved due to a collation conflict between “Latin1_General_CI_AS” and “SQL_Latin1_General_CP1_CI_AS” in add operator. [SQLSTATE 42000] (Error 457).

You may find a collation issue with some of your queries particularly whenever joins are involved. You can solve this problem by simply adjusting your query to include the suffice COLLATION ‘MyServerCollation’, but this will of course only affect that current query. The question remains; how many other columns have different collations across how many tables? What are those columns anyway?

Use this SQL logic to get that answer.

---
## Logic
```SQL
select
'table name' = object_name(sc.id)
,   'column' = sc.name
,   'collation' = sc.collation
from
syscolumns sc
where
objectproperty([id], 'isusertable')=1
and collation is not null
--and   collation &lt;&gt; 'sql_latin1_general_cp1_ci_as'
order by
object_name(sc.id), sc.name asc

```



[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Build-Info

| Build Quality | Build History |
|--|--|
|<table><tr><td>[![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg?style=flat-square)](#)</td></tr><tr><td>[![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?style=flat-square)](#)</td></tr><tr><td>[![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#)</td></tr></table>|<table><tr><td>[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](#)</td></tr></table>|

## Author

- **李聪明的数据库 Lee's Clever Data**
- **Mike的数据库宝典 Mikes Database Collection**
- **李聪明的数据库** "Lee Songming"

[![Gist](https://img.shields.io/badge/Gist-李聪明的数据库-<COLOR>.svg)](https://gist.github.com/congmingshuju)
[![Twitter](https://img.shields.io/badge/Twitter-mike的数据库宝典-<COLOR>.svg)](https://twitter.com/mikesdatawork?lang=en)
[![Wordpress](https://img.shields.io/badge/Wordpress-mike的数据库宝典-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

---
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Lee Songming](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/1-clever-data-github.png "李聪明的数据库")

