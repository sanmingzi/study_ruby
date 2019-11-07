# Rails find find_by where

[find vs find_by vs where](https://stackoverflow.com/questions/11161663/find-vs-find-by-vs-where)

## find

- 根据id进行查询
- 如果是参数是1个id，found: return ActiveRecord / not found: raise Error;  
- 如果参数是多个id，只要有一个没找到: raise Error / 全部找到: return array of ActiveRecord

```ruby
Article.find(1)
# SELECT  `articles`.* FROM `articles` WHERE `articles`.`id` = 1 LIMIT 1

Article.find(1, 2, 3)
# SELECT `articles`.* FROM `articles` WHERE `articles`.`id` IN (1, 2, 3)

Article.find(1, 2, 100)
# ActiveRecord::RecordNotFound (Couldn't find all Articles with 'id': (1, 2, 100) (found 2 results, but was looking for 3).)
```

## find_by

- 参数为一个hash
- 找到了只返回第1个ActiveRecord
- 找不到返回nil

```ruby
Article.find_by(id: 1)
# SELECT  `articles`.* FROM `articles` WHERE `articles`.`id` = 1 LIMIT 1

Article.find_by(id: [1, 2, 100])
# SELECT  `articles`.* FROM `articles` WHERE `articles`.`id` IN (1, 2, 100) LIMIT 1

Article.find_by(id: 100)
# SELECT  `articles`.* FROM `articles` WHERE `articles`.`id` = 100 LIMIT 1
# nil
```

## where

- 参数同find_by一样，为一个hash
- 返回值为ActiveRecord::Relation
- 找不到时返回一个空的ActivRecord::Relation

```ruby
Article.where(id: 1)
# SELECT  `articles`.* FROM `articles` WHERE `articles`.`id` = 1 LIMIT 11
# ActiveRecord::Relation

Article.where(id: 100)
# SELECT  `articles`.* FROM `articles` WHERE `articles`.`id` = 100 LIMIT 11
# ActiveRecord::Relation []

Article.where(id: [1, 100])
# SELECT  `articles`.* FROM `articles` WHERE `articles`.`id` IN (1, 100) LIMIT 11
```
