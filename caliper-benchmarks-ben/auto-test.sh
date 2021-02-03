rm report*
rm caliper.log
rm -r ../../tmp/hfc-kvs
rm -r ../../tmp/hfc-cvs

for v in {1..10}
#for varible1 in 1 2 3 4 5
do
     npx caliper benchmark run --caliper-benchconfig benchmarks/samples/fabric/marbles/config2.yaml --caliper-networkconfig networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/fabric-ccp-go-tls-keep.yaml --caliper-workspace .

#     docker pull hyperledger/fabric-ccenv:1.4.4

#     docker tag hyperledger/fabric-ccenv:1.4.4 hyperledger/fabric-ccenv:latest

     cp report.html report-$v.html
done

#for v in {11..20}
#for varible1 in 1 2 3 4 5
#do
#     npx caliper benchmark run --caliper-benchconfig benchmarks/samples/fabric/marbles/config1.yaml --caliper-networkconfig networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/fabric-ccp-go-tls.yaml --caliper-workspace .

#     docker pull hyperledger/fabric-ccenv:1.4.4

#     docker tag hyperledger/fabric-ccenv:1.4.4 hyperledger/fabric-ccenv:latest

#     cp report.html report-$v.html
#done
