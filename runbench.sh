#./bin/go-ycsb run rocksdb --threads 80 -P workloads/workloada1KB4GB -p rocksdb.dir="/mnt/raid0/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=8
#sudo echo hello
#sudo cgexec -g blkio:test_write ./bin/go-ycsb run rocksdb --threads 80 -P workloads/workloada1KB4GB -p rocksdb.dir="/mnt/raid0/test"

ulimit -n 65535

echo "---------run ulimited--------"
./bin/go-ycsb run rocksdb --threads 80 -P workloads/workloada1KB100GB -p rocksdb.dir="/mnt/raid0/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=8 > ./result/ulimited.txt
sleep 300

rm -rf /mnt/raid0/testrocksdb
cp -r /mnt/raid0/testrocksdbBackup /mnt/raid0/testrocksdb
echo "---------run 750MB/s--------"
sudo bash -c "echo '9:0 768000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.write_bps_device"
sudo bash -c "echo '9:0 768000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.read_bps_device"
sudo cgexec -g blkio:test_write ./bin/go-ycsb run rocksdb --threads 80 -P workloads/workloada1KB100GB -p rocksdb.dir="/mnt/raid0/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=8 > ./result/750M.txt
sleep 300

rm -rf /mnt/raid0/testrocksdb
cp -r /mnt/raid0/testrocksdbBackup /mnt/raid0/testrocksdb
echo "---------run 512MB/s--------"
sudo bash -c "echo '9:0 512000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.write_bps_device"
sudo bash -c "echo '9:0 512000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.read_bps_device"
sudo cgexec -g blkio:test_write ./bin/go-ycsb run rocksdb --threads 80 -P workloads/workloada1KB100GB -p rocksdb.dir="/mnt/raid0/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=8 > ./result/512M.txt
sleep 300

rm -rf /mnt/raid0/testrocksdb
cp -r /mnt/raid0/testrocksdbBackup /mnt/raid0/testrocksdb
echo "---------run 256MB/s--------"
sudo bash -c "echo '9:0 256000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.write_bps_device"
sudo bash -c "echo '9:0 256000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.read_bps_device"
sudo cgexec -g blkio:test_write ./bin/go-ycsb run rocksdb --threads 80 -P workloads/workloada1KB100GB -p rocksdb.dir="/mnt/raid0/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=8 > ./result/256M.txt
sleep 300

rm -rf /mnt/raid0/testrocksdb
cp -r /mnt/raid0/testrocksdbBackup /mnt/raid0/testrocksdb
echo "---------run 128MB/s--------"
sudo bash -c "echo '9:0 128000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.write_bps_device"
sudo bash -c "echo '9:0 128000000' > /sys/fs/cgroup/blkio/test_write/blkio.throttle.read_bps_device"
sudo cgexec -g blkio:test_write ./bin/go-ycsb run rocksdb --threads 80 -P workloads/workloada1KB100GB -p rocksdb.dir="/mnt/raid0/testrocksdb" -p rocksdb.max_background_jobs=8 -p rocksdb.max_write_buffer_number=8 > ./result/128M.txt
sleep 300