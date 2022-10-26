# Terraform Network AWS

Esté codigo criar vpc, subnets, internet gateway

# Dependencias
* Terraform 1.3

# Como executar o codigo

## Iniciando o modulos

``` 
terraform init -backend-config=dev.con
```
## Criando Plano

```
terraform plan -var-file=dev.tfvars
```

## Aplicando o terraform

```
terraform apply -var-file=dev.tfvars
```

