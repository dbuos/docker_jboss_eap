#!/bin/bash
/opt/jbossas/bin/domain.sh > /server.log &
/usr/bin/expect  <<- EOF
    set timeout 120
    spawn tail -f /server.log
    expect -re ".*started in.*"
EOF

echo "Configurando drivers JDBC.."
/opt/jbossas/bin/jboss-cli.sh --connect --user=admin --password=feskntA2* --command="deploy /jdbc/ojdbc6.jar --all-server-groups"
/opt/jbossas/bin/jboss-cli.sh --connect --user=admin --password=feskntA2* --command="deploy /jdbc/postgresql-9.4-1201.jdbc4.jar --all-server-groups"
/opt/jbossas/bin/jboss-cli.sh --connect --user=admin --password=feskntA2* /host=master:shutdown
echo "Drivers configurados!"

echo "Waiting for Jboss to Stop.."
pids=( $(jps | awk '{print $1}') )
for pid in "${pids[@]}"; do
    while kill -0 "$pid"; do
        sleep 0.5
    done
done

jps


