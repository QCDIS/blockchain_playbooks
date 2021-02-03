rm -r ../../tmp/hfc-kvs/
docker service rm $(docker service ls -q)
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -q)
docker network rm caliper-overlay
docker network prune
docker volume prune

#docker pull hyperledger/fabric-ccenv:1.4.4
#docker tag hyperledger/fabric-ccenv:1.4.4 hyperledger/fabric-ccenv:latest

