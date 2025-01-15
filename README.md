# Terraform IaC Project

## Overview
This project uses **Terraform** to manage Infrastructure as Code (IaC) for provisioning AWS resources. It is designed to automate the setup and configuration of S3 buckets and CloudFront distributions.

## Prerequisites
To work with this project, ensure the following are installed and configured:

1. [Terraform](https://www.terraform.io/downloads) (v1.0 or higher recommended)
2. AWS CLI configured with appropriate access credentials
3. Access to an AWS account with necessary IAM permissions to create S3 buckets and CloudFront distributions

## Project Structure
The project is modularized for better reusability and organization.

- **modules/s3**: Contains the Terraform configuration for provisioning S3 buckets.
- **modules/cloudfront**: Contains the Terraform configuration for provisioning CloudFront distributions.
- **resource.tf**: Resource entry point for Terraform, referencing the modules and providing required inputs.
- **variables.tf**: Defines input variables for the project.
- **outputs.tf**: Defines output values to expose key information from the resources.
- **providers.tf**: Configures the AWS provider.

## Features

1. **S3 Module**:
   - Creates S3 buckets with optional configurations for versioning, encryption, and access control.
   - Allows custom tagging of resources.

2. **CloudFront Module**:
   - Configures CloudFront distributions to serve content from S3 buckets.
   - Supports optional configurations like custom error responses and logging.

## Usage
### Initialize the Project
Run the following command to initialize Terraform and download required provider plugins:
```bash
terraform init
```

### Plan Infrastructure Changes
Generate and review the execution plan with:
```bash
terraform plan
```

### Apply Infrastructure Changes
Apply the planned changes to provision resources:
```bash
terraform apply
```

### Destroy Infrastructure
If you need to clean up resources, run:
```bash
terraform destroy
```

## Configuration
### Input Variables
This project uses input variables defined in `variables.tf`. Examples include:

- `bucket_name`: Name of the S3 bucket to create
- `cloudfront_origin`: The origin configuration for the CloudFront distribution

### Outputs
Key outputs from the project include:

- S3 bucket ARN
- CloudFront distribution ID
- CloudFront domain name

## Notes
- Ensure your AWS account has sufficient permissions to create the resources.
- Costs may incur for the usage of AWS services. Monitor your usage to avoid unexpected charges.

## References
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS S3 Documentation](https://aws.amazon.com/s3/)
- [AWS CloudFront Documentation](https://aws.amazon.com/cloudfront/)

