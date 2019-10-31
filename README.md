# nopCommerce on AKS

Execute create.sh

```bash
./create.sh
```

You editor confurations.

* redis.conf
* nop-appsettings.json

### VolumeClaim.yaml

* Apply azure disk for SqlServer named mssql-data.
* Apply azure file for nopCommerce named azurefile.

### SqlServer2017.yaml

* Deployment SqlServer2017 named `mssql` using persistent volume mssql-data.The default password at create.sh.
* Create a `ClusterIP` type of service named `k8s-mssql` for k8s-mssql deployment

### redis.yaml

* Deployment Redis 'deployment' named `redis-app`.
* Create a `ClusterIP` type of service named `redisvc` for redis-app deployment

### nopcommerce.yaml

* Deployment nopCommerce `deployment` named `nop`.
* Create a `LoadBalancer` type of service named `nopservice` for nop deployment

Now you can execute `kubectl get svc` to get ip for `nopservice`.Visit in ip to install nopCommerce.

You can scale the nop after the installation is complete.