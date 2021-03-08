cd ~
cd /root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config
./generate.sh

cd ~

ssh compute1 "mkdir -p /root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/"
scp -r /root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config/ compute1:/root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/

ssh compute2 "mkdir -p /root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/"
scp -r /root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config/ compute2:/root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/

ssh compute3 "mkdir -p /root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/"
scp -r /root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/config/ compute3:/root/caliper-bench/azure-3nodes/caliper-benchmarks/networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/

cd /root/caliper-bench/azure-3nodes/monitor
./start.sh

cd ../caliper-benchmarks/
npx caliper benchmark run --caliper-benchconfig benchmarks/samples/fabric/marbles/config.yaml --caliper-networkconfig networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/fabric-ccp-go-tls.yaml --caliper-workspace .

