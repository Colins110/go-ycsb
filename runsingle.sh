ulimit -n 65535


iostat -d -x -m /dev/sdf 1 14400 > ./result/singleSSD-ulimit-iostat-1_19.txt &
echo "----------- start run ----------"
#sudo cgexec -g blkio:test_write ./bin/go-ycsb run rocksdb --interval 1 --threads 120 -P workloads/workloada1KB100GB_2 -p rocksdb.dir="/mnt/sdf/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=2 > ./result/singleSSD-ulimit-1s-report.txt
./bin/go-ycsb run rocksdb --interval 1 --threads 120 -P workloads/workloada1KB100GB_2 -p rocksdb.dir="/mnt/sdf/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=2 -p rocksdb.report_dbstatus=true -p rocksdb.report_interval=10 -p rocksdb.report_file="./result/DBReport-1_19.txt" > ./result/singleSSD-ulimit-1s-report-1_19.txt 