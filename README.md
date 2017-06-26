# UnQLite数据库

## 数据库基础知识

### 事务

   - 概念:一个数据库事务通常包含对数据库进行读或写的一个操作序列.它的存在包含有以下两个目的:
    1、为数据库操作提供了一个从失败中恢复到正常状态的方法，同时提供了数据库即使在异常状态下仍能保持一致性的方法
    2、当多个应用程序在并发访问数据库时，可以在这些应用程序之间提供一个隔离方法，以防止彼此的操作互相干扰
 当一个事务被提交给了DBMS（数据库管理系统），则DBMS需要确保该事务中的所有操作都成功完成且其结果被永久保存在数据库中，
 如果事务中有的操作没有成功完成，则事务中的所有操作都需要被回滚，回到事务执行前的状态（要么全执行，要么全都不执行）;
 同时，该事务对数据库或者其他事务的执行无影响，所有的事务都好像在独立的运行。
        

   - 特性
    并非任意的对数据库的操作序列都是数据库事务。事务应该具有4个属性：原子性、一致性、隔离性、持久性。这四个属性通常称为ACID特性
[参考资料](http://www.hollischuang.com/archives/898)

## UNQLite简介

``` shell

    UnQLite是一个文档存储数据库，类似于MongoDB、Redis、CouchDB等。同时，
    也是一个标准的Key/Value存储，与BerkeleyDB和LevelDB等类似．UnQLite是一个嵌入式NoSQL（键/值存储和文档存储）数据库引擎。
    不同于其他绝大多数NoSQL数据库，UnQLite没有一个独立的服务器进程。UnQLite直接读/写普通的磁盘文件,
    UnQLite是一个自包含的C语言程序库，无任何外部依赖
    
    单一数据库文件:
        一个UnQLite数据库，是一个单一的普通磁盘文件，可以位于目录层次结构的任何地方。只要UnQLite可以读取这个磁盘文件，
        就可以读取这个数据库中的任何数据。只要这个磁盘文件和所在目录是可读可写的，UnQLite就可以修改数据库中的任何内容

```

## UNQLite存储方式

``` shell

    结构化数据存储：
    
        UnQLite的结构化数据存储是通过文档存储接口表达给客户端的。文档存储本身是用来存储JSOB文档
        （如，对象、数组、字符串等）在数据库中，而且由Jx9编程语言支撑。
        Jx9是一种嵌入式的脚本语言，也叫扩展语言，被设计用于通用过程化编程，具备数据表述的特性。
    
        
    原始数据存储：
        原始数据存储是通过Key/Value存储接口表达给客户端的。UnQLite是一个标准的key/value存储，
        类似于Berkeley DB、Tokyo Cabinet和LevelDB等，但拥有更加丰富的特性，包括支持事务（ACID），并发读取等。
        在KV存储下，键和值都被视为简单的字节数组，所以内容可以是任何东西，包括ASCII字符串、二进制对象和磁盘文件等

```

## 注意事项

- Transactions are not supported for in-memory databases.(内存数据库部不支持事务)

- unqlite_kv_cursor_init() and unqlite_kv_cursor_release() are thread-safe while the other interfaces are not.
 Caller must ensure that no other thread can access the same cursor handle. Otherwise the result is undefined.

## 接口使用

- 数据库错误返回,打印日志

``` c

    if( rc != UNQLITE_OK )　{
      const char *zBuf;
      int iLen;
      
      /* Something goes wrong, extract database error log */
      
      unqlite_config(pDb,UNQLITE_CONFIG_ERR_LOG,&zErr,&iLen);
      
      if( iLen > 0 ){
        puts(zBuf);
      }
    }
    
```
- unqlite_kv_store函数和unqlite_kv_store_fmt函数

``` shell

        Write a new record into the database. If the record does not exists, it is created. 
        Otherwise, it is replaced. That is, the new data overwrite the old data. 
    
```

- 删除记录

``` shell

        1.删除一条记录 unqlite_kv_delete()
        2.删除多条记录 unqlite_kv_cursor_delete_entry()
    
```

- Positioning Database Cursors :遍历数据记录

``` c

    int unqlite_kv_cursor_valid_entry(unqlite_kv_cursor *pCursor)
    
    返回值：
        1 : the cursor is pointing to a valid record (有效数据记录)
        0:  无效的数据记录 
    
```
