# The order of using Playbooks 

1. install.yaml

2. install-caliper.yaml

3. create_swarm_cluster.yaml

VMs need to join the swarm cluster through inter IP address 

4. install_hyperledger.yaml

5. caliper-benchmark.yaml

# Hyperledger Fabric Deployment
This repository is about how to deploy Hyperledger Fabric, Hyperledger Caliper and Monitor tools.

### Config environment on all hosts
At first, we need to config the environment on each VM. 

On one VM, we can run `install.sh` directly which indludes `install go, docker, docker-compose, Nodejs, Fabric, node-gyp etc.`

If Use Ansible for multiple VMs.

a. Copy Install.sh to each host 

`ansible target-ip -m copy -a "src=/root/install.sh dest=/root/install.sh mode=0755"`

b. Run Install.sh on each host

`ansible target-ip -m shell -a "/root/go.sh"`

### Install Caliper on the manager host. 
We can install Caliper on manager host. 
Run `Install_Caliper.sh` 

### Docker swarm init and join
a. On manager host: 
docker swarm init --advertise-addr manager-host-IP

b. On each host:
docker swarm join (Ansible)

### Start Monitor 
a. Set cAdvisor and nodeExporter deployment place in prometheus.yml and swarm-compose.yml 

b. Run start.sh 

### Prepare fabric network 
a. Define peer and orderer nodes number in crypto-config.yaml and configtx.yaml

b. Run generate.sh to generate crypto files 

c. Send cryto files to worker nodes. 

d. Define docker-swarm-compose-tls.yaml 

Including fabric network ca, peer, orderer services

e. Define fabric-ccp-go-tls.yaml files.

Including Caliper clients, channels, organizations, orderer, peer, ca configuration. 

### Prepare caliper test benchmark and config files
a. Prepare init.js and query.js according to chaincode

b. Define test configurations in config.yaml 

### Run the test
a. On manager host, run Caliper test.
npx caliper benchmark run --caliper-benchconfig benchmarks/samples/fabric/marbles/configs.yaml --caliper-networkconfig networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/fabric-ccp-go-tls.yaml --caliper-workspace .

b. If you want to create a network and run benchmark and then not tear down the network.
npx caliper benchmark run --caliper-benchconfig benchmarks/samples/fabric/marbles/configs.yaml --caliper-networkconfig networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/fabric-ccp-go-tls-keep.yaml --caliper-workspace .

c. If you want to connect to the existing network and run benchmarks (this can be the network from point 2).   
npx caliper benchmark run --caliper-benchconfig benchmarks/samples/fabric/marbles/config.yaml --caliper-networkconfig networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/fabric-ccp-go-tls-existing.yaml --caliper-workspace .
