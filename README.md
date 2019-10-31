# nopCommerce on AKS

Clone this project.
Execute create.sh.

```bash
./create.sh
```

You editor confurations.

* redis.conf
* nop-appsettings.json

### VolumeClaim.yaml

* Apply azure disk for SqlServer named `mssql-data`.
* Apply azure file for nopCommerce named `azurefile`.

### SqlServer2017.yaml

* Deployment SqlServer2017 named `mssql-deployment` using persistent volume mssql-data.The default password at create.sh.
* Create a `ClusterIP` type of service named `k8s-mssql` for k8s-mssql deployment

### redis.yaml

* Deployment Redis 'deployment' named `redis-app`.
* Create a `ClusterIP` type of service named `redisvc` for redis-app deployment

### nopcommerce.yaml

* Deployment nopCommerce `deployment` named `nop-deployment`.
* Create a `LoadBalancer` type of service named `nopservice` for nop deployment

Now you can execute `kubectl get svc` to get ip for `nopservice`.Visit in ip to install nopCommerce.

Notice:You must install it before you can scale the `nop deployment`.

You can scale the `nop deployment` after the installation is complete.
```bash
kubectl scale deployment nop-deployment --replicas=5
```