# leveldb

## 安装步骤

``` shell

    git clone https://github.com/google/leveldb.git
    cd leveldb/
    make
    sudo cp out-static/lib* out-shared/lib* /usr/local/lib/
    cd include/
    sudo cp -r leveldb /usr/local/include/
    sudo ldconfig
      							
```

## 简介

- 一个LevelDB数据库有一个文件系统目录名称与之关联。该数据库的所有内容都存储在该目录下

## 接口

``` c

    leveldb::WriteOptions writeOptions;
    
    描述:
        默认: writeOptions.sync = false;当机器崩溃时则某些最近的写入可能会丢失。 请
        注意，如果只是崩溃的进程（即机器不重新启动），即使sync = false也不会丢失任何写入
        
    writeOptions.sync = true;  //每一次都会写入到磁盘中,所以速度较慢
    
    异步性的写操作通常要比同步性的快1000倍
      							
```

``` c

    leveldb::Iterator* it = db->NewIterator(leveldb::ReadOptions());
    
    注意:
        返回的 it 是堆栈分配的　leveldb::Iterator的指针,用完后一定要 delete it,并且要在 delete db 之前
        (caller must call one of the Seek methods on the iterator before using it)
      							
```

- 读操作与写操作

``` c

  std::string value;
  leveldb::Status s = db->Get(leveldb::ReadOptions(), key1, &value);
  if (s.ok()) s = db->Put(leveldb::WriteOptions(), key2, value);
  if (s.ok()) s = db->Delete(leveldb::WriteOptions(), key1);
  
```
  
- 原子性更新

``` c

    需要注意的是。在上面的操作中，如果在Put key2之后，delete key1之前，进程死掉了，那么相同的value值就可能会存储在多个key值下面。
    例如在key1和key2的值是相同的.
    
    可以通过使用WriteBatch类原子性的执行一组更新操作，来避免这样的问题：
    
      #include "leveldb/write_batch.h"
      ...
      std::string value;
      leveldb::Status s = db->Get(leveldb::ReadOptions(), key1, &value);
      if (s.ok()) {
        leveldb::WriteBatch batch;
        batch.Delete(key1);
        batch.Put(key2, value);
        s = db->Write(leveldb::WriteOptions(), &batch);
      }
      
    WriteBatch
        对数据库的一系列更改操作，这些操作会按照它们加入顺序被执行。除了提供这种原子性的保证外，
        WriteBatch还可以通过将多个更新放到同一个batch里，在存在大量更新操作时，加速它们的执行。

 ```
- 并发

``` c

    同一时刻只能有一个进程打开数据库。为了防止误用，LevelDB实现会从操作系统申请一把锁。在一个进程内部，同一个leveldb::DB
    对象可以安全地被多个并发线程共享。多个线程可以在同一个数据库中写数据，获取迭代器，
    执行Get调用而不需要额外的同步(LevelDB实现会自动的完成所需的同步)。
    然而其他对象(比如迭代器和WriteBatch)可能需要额外的同步。
    如果两个线程共享相同的此类对象，它们必须使用自己的锁机制来保护对此类对象的访问。

 ```
 
 - Slice类 
 
 ``` c
 
     Slice(const char* d, size_t n) : data_(d), size_(n) { } 
     
     构造结构体 :
     
     Point  value_point = {2,3};
     db->Put(writeOptions, "point1", leveldb::Slice((char *)(&value_point), sizeof(Point)));
     
     放回数据头指针
     // Return a pointer to the beginning of the referenced data
       const char* data() const { return data_; }
   
     是不是以"XXX"开头
    bool starts_with(const Slice& x) const {
     return ((size_ >= x.size_) &&
             (memcmp(data_, x.data_, x.size_) == 0));
   }
  ```