# README.md

This is an example terraform code to set up the AWS VPC, Security Groups, EC2 instances hosting a sample webserver and mysql DB.


## requirements

Download and copy to /usr/local/bin

* [terraform](https://www.terraform.io/downloads.html)

Your AWS credentials have permissions to create ec2 instances, vpcs, security groups, RDS etc.

## basic usage

Export AWS credentials 

```bash
$ export AWS_ACCESS_KEY_ID=<myaccesskey>
$ export AWS_SECRET_ACCESS_KEY=<mysecretkey>
```

## Setup s3 backend

CD to `remote-state` directory and 

```bash
make init
```
Run the terraform plan:

```bash
make plan
```
Apply the changes

```bash
make apply
```
This will setup the s3 backend.


## Setup Networking

CD to `demo/networking` directory and execute:

```bash
make init
make update
```
Run the terraform plan:

```bash
make plan
```
Apply the changes

```bash
make apply
```

This will set up the VPC, Public/Private subnets, Security Groups for webserver and database.

The terraform outputs will be as follows. These will be used as inputs for `web` terraform stage.

```bash
Outputs:

db_sg_id = sg-xxxxxxxxxx
private_subnet_id = subnet-xxxxxxxxxxxxx
public_subnet_id = subnet-xxxxxxxxxxxxx
vpc_id = vpc-xxxxxxxxxxxxxx
web_sg_id = sg-xxxxxxxxxx
```

You can use the `terraform.tfvars` to automatically input to terraform plan and apply.

Example `terraform.tfvars`:
```bash
environment        = "demo"
key_name           = "test"
region             = "us-east-1"
availability_zone  = "us-east-1a"

# vpc
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
```


## Setup webserver and mysql DB instances

CD to `demo/web` directory to set up MySQL RDS DB. You can also use `terraform.tfvars` here to perform this with less interaction.


```bash
make init
make update
```
Run the terraform plan:

```bash
make plan
```
Apply the changes

```bash
make apply
```

After applying the `web` terraform changes, the `elb_hostname` value in the output can be used to access the webserver.
http://<elb-hostname>/demodb.php

This will connect to the DB instance and display the followoing 

```bash
the value is: terraformdemo
```


## Cleanup

To cleanup the provisioned infrastructure, run the below command from all the directories - `web`, `networking` and `remote-state`.

```bash
make destroy
```

