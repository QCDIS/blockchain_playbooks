cd ~
cd /root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config
./generate.sh

cd ~

ssh Node0 "mkdir -p /root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/"
scp -r /root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config/ Node0:/root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/

ssh Node1 "mkdir -p /root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/"
scp -r /root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config/ Node1:/root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/

ssh Node2 "mkdir -p /root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/"
scp -r /root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config/ Node2:/root/caliper-bench/caliper-benchmarks-ben/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/

cd /root/caliper-bench/monitor
./start.sh

cd ../caliper-benchmarks-ben/
npx caliper benchmark run --caliper-benchconfig benchmarks/samples/fabric/marbles/config.yaml --caliper-networkconfig networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/fabric-ccp-go-tls.yaml --caliper-workspace .

