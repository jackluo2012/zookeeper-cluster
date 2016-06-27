#!/bin/bash
#create myid
MYID=${MYID:-1}

touch $ZOOKEEPER_HOME/data/myid
echo $MYID > $ZOOKEEPER_HOME/data/myid
#exec $zk_home/bin/zkServer.sh start > /dev/null 2>&1 
echo " zookeeper is start"
$ZOOKEEPER_HOME/bin/zkServer.sh start-foreground
