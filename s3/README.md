# Overview
AWS S3 terraform module

# Demo
- Go to `s3/demo`
- Replace [account id](https://github.com/thisismindo/tf-modules/blob/main/s3/demo/main.tf#L27)
- Initialize `terraform`
```sh
terraform init
```
- Preview terraform action
```sh
terraform plan
```
- Deploy changes to AWS
```sh
terraform apply
```
- Destroy s3 resource
```sh
terraform destroy
```

# Requirements
- terraform >= 1.3.7
- aws >= 4.54.0
