#nodes
kubectl get node
echo '_____________________________________________________________________'
echo ''
echo '_____________________________________________________________________'
echo 'Persistent volume'
echo 'configuring Persistent volume and Persistent volume claim'
kubectl apply -f VolumeClaim.yaml

echo 'check the status of persistent volume and volume claim.'
kubectl get pv
kubectl get pvc
echo '_____________________________________________________________________'
echo ''
echo '_____________________________________________________________________'
echo 'MSSQL'
echo 'configuring SQL Server SQL secret'
kubectl create secret generic mssql --from-literal=SA_PASSWORD="Qwer1@345678" --dry-run -o yaml | kubectl apply -f -

echo 'deploying SQL Server SQL'
kubectl apply -f SqlServer2017.yaml
echo '_____________________________________________________________________'
echo ''
echo '_____________________________________________________________________'
echo 'redis'
echo 'configuring redis-conf configmap'
kubectl create configmap redis-conf --from-file=redis.conf --dry-run -o yaml | kubectl apply -f -

echo 'print redis-conf configmaps'
kubectl get configmaps redis-conf -o yaml

echo 'deploying Redis'
kubectl apply -f redis.yaml
echo '_____________________________________________________________________'
echo ''
echo '_____________________________________________________________________'
echo 'nopCommerce'
echo 'configuring nop-appsettings configmaps'
kubectl create configmap nop-appsettings --from-file=./nop-appsettings.json --dry-run -o yaml | kubectl apply -f -

echo 'print nop-appsettings configmaps'
kubectl get configMap nop-appsettings -o yaml

echo 'deploying nopCommerce'
kubectl apply -f nopcommerce.yaml
echo '_____________________________________________________________________'

echo 'print pods'
kubectl get pods

echo '_____________________________________________________________________'
echo 'get services'
kubectl get svc

#echo 'scale nop-deployment'
#kubectl scale deployment nop-deployment --replicas=5
