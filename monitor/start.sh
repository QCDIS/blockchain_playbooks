../caliper-benchmarks-im-VM1/shutdown.sh

docker network create --attachable -d overlay caliper-overlay 

docker stack deploy prometheus -c swarm-compose.yaml

