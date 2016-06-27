#!/bin/bash
# the default node number is 3
N=${1:-4}
# start hadoop slave container
i=1
while [ $i -lt $N ]
do
        sudo docker stop zk-$i > /dev/null 2>&1
        sudo docker rm -f zk-$i > /dev/null 2>&1
        echo "start zk-$i container..."
        sudo docker run -dt \
			-e MYID=$i \
                        --net=hadoop \
	                --name zk-$i \
                        --hostname zk-$i \
                        jackluo/zk:3.4.8 > /dev/null 2>&1
        i=$(( $i + 1 ))
done
docker run -it jackluo/zk:3.4.8 /bin/bash
