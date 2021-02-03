rm report*
rm caliper.log
rm -r ../../tmp/hfc-kvs
rm -r ../../tmp/hfc-cvs

docker stack rm caliper-overlay
docker rmi -f $(docker images "hyperledger\/*")
sleep 5s
