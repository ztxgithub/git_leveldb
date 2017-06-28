#include <iostream>
#include <iostream>
#include <sstream>
#include <string>
#include <pthread.h>
#include "elog.h"
#include "log.h"
#include "leveldb/db.h"
#include <stddef.h>

using namespace std;

struct Point {
    int x;
    int y;
};

int main() {

    /* close printf buffer */
    setbuf(stdout, NULL);
    /* initialize EasyLogger */
    elog_init();
    /* set EasyLogger log format */
    elog_set_fmt(ELOG_LVL_ASSERT, ELOG_FMT_ALL);
    elog_set_fmt(ELOG_LVL_ERROR, ELOG_FMT_LVL | ELOG_FMT_TAG | ELOG_FMT_TIME);
    elog_set_fmt(ELOG_LVL_WARN, ELOG_FMT_LVL | ELOG_FMT_TAG | ELOG_FMT_TIME);
    elog_set_fmt(ELOG_LVL_INFO, ELOG_FMT_LVL | ELOG_FMT_TAG | ELOG_FMT_TIME);
    elog_set_fmt(ELOG_LVL_DEBUG, ELOG_FMT_ALL & ~ELOG_FMT_FUNC);
    elog_set_fmt(ELOG_LVL_VERBOSE, ELOG_FMT_ALL & ~ELOG_FMT_FUNC);
    /* start EasyLogger */
    elog_start();

    leveldb::DB* db;
    leveldb::Options options;
    options.create_if_missing = true;


    leveldb::Status status = leveldb::DB::Open(options, "./testdb", &db);

    if (false == status.ok()) {
        cerr << "Unable to open/create test database './testdb'" << endl;
        cerr << status.ToString() << endl;
        return -1;
    } else {
        log_e("open db success: %s", status.ToString().c_str());
    }

    // Add 256 values to the database
    leveldb::WriteOptions writeOptions;


    for (unsigned int i = 0; i < 10; ++i) {
        ostringstream keyStream;
        keyStream << "Key" << i;

        ostringstream valueStream;
        valueStream << "Test data value: " << i;

//        db->Put(writeOptions, keyStream.str(), valueStream.str());

        db->Put(writeOptions, "key", valueStream.str());

        db->Put(writeOptions, "key1", valueStream.str());
        db->Put(writeOptions, "key2", valueStream.str());
    }

    //删除
    db->Delete(writeOptions, "key");


    /*构造结构体*/

    Point  value_point = {2,3};
    db->Put(writeOptions, "point1", leveldb::Slice((char *)(&value_point), sizeof(Point)));

    string s_point;
    db->Get(leveldb::ReadOptions(), "point1", &s_point);
    Point  *ptr_point = (Point  *)s_point.c_str();
    log_e("point.x[%d], point.y[%d]", ptr_point->x, ptr_point->y);


    /*获取特定的元素*/

    string value;
    leveldb::Status getValueStauts = db->Get(leveldb::ReadOptions(), "key", &value);
    if(getValueStauts.IsNotFound()) {
        log_e("specific key not find");
    } else {
        log_e("key exist value[%s]", value.c_str());
    }



    /*查找以"xxx"开头的key值*/

    leveldb::Iterator* it_prefix = db->NewIterator(leveldb::ReadOptions());

    log_e("find prefix start");
    for (it_prefix->SeekToFirst(); it_prefix->Valid() && it_prefix->key().starts_with("key"); it_prefix->Next()) {
        cout << it_prefix->key().ToString() << " : " << it_prefix->value().ToString() << endl;
    }
    log_e("find prefix end");
    delete it_prefix;



    // Iterate over each item in the database and print them
    leveldb::Iterator* it = db->NewIterator(leveldb::ReadOptions());


    for (it->SeekToFirst(); it->Valid(); it->Next()) {
        cout << it->key().ToString() << " : " << it->value().ToString() << endl;
    }

    if (false == it->status().ok()) {
        cerr << "An error was found during the scan" << endl;
        cerr << it->status().ToString() << endl;
    }

    delete it;

//    system("reboot");
    // Close the database
    delete db;


    return 0;
}
