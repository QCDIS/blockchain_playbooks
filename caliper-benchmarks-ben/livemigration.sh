starttime=$(date +%Y-%m-%d\ %H:%M:%S)
echo $starttime

scp -r /var/lib/docker/volumes root@198.199.82.28:/var/lib/docker/
docker stack deploy --compose-file networks/fabric/fabric-v1.4.1/swarm-3org1peer-raft/docker-swarm-compose-tls1.yaml caliper-overlay
endtime=$(date +%Y-%m-%d\ %H:%M:%S)
echo $endtime
