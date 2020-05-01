# nopCommerce on AKS

Clone this project.
Execute create.sh.

```bash
./create.sh
```

Now you can execute `kubectl get svc` to get ip for `nopservice`.Visit in ip to install nopCommerce.

Notice:You must install it before you can scale the `nop deployment`.

You can scale the `nop deployment` after the installation is complete.
```bash
kubectl scale deployment nop-deployment --replicas=5
```
### Configurations

You can edit the following configurations.

* redis.conf
* nop-appsettings.json

### VolumeClaim.yaml

* Apply an azure disk named `mssql-data` for SqlServer.
* Apply an azure file named `azurefile` for nopCommerce.

### SqlServer2017.yaml

* Deployment SqlServer2017 named `mssql-deployment` with a persistent volume named mssql-data.The default password at `create.sh` file.
* Create a service of `ClusterIP` type named `k8s-mssql` for `k8s-mssql deployment`.

### redis.yaml

* Deployment Redis `deployment` named `redis-app`.
* Create a service of `ClusterIP` type named `redisvc` for `redis-app deployment`.

### nopcommerce.yaml

* Deployment nopCommerce `deployment` named `nop-deployment`.
* Create a service of `LoadBalancer` type named `nopservice` for `nop deployment`.
