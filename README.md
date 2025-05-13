# 🖥️ Automated Linux Server Provisioning with Terraform

This project automates the provisioning and configuration of a Linux EC2 instance on AWS using **Terraform**. The instance is bootstrapped with **Nginx**, **Docker**, and a new user (`harika`) using a user-data script.

---

## 🚀 Project Features

- Provision Ubuntu EC2 instance in AWS.
- Automatically install:
  - Nginx (starts and enabled)
  - Docker (starts and enabled)
- Create a user `harika` with a default password.
- Add `harika` to `sudo` and `docker` groups.
- Outputs the public IP of the instance.

---

## 🛠️ Prerequisites

- MacBook with:
  - [Terraform](https://developer.hashicorp.com/terraform/install)
  - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- AWS account with:
  - IAM user
  - Access key, secret key
  - Key pair (to SSH into EC2)

---

## 📁 Project Structure

```
terraform-linux-provision/
├── main.tf              # Terraform config for EC2
├── variables.tf         # Input variables
├── terraform.tfvars     # Variable values
├── outputs.tf           # Public IP output
├── user_data.sh         # Bash script to install packages and add user
└── README.md            # Documentation
```

---

## 📦 Steps to Use

### 1. Clone and Enter the Directory

```bash
git clone https://github.com/yourusername/terraform-linux-provision.git
cd terraform-linux-provision
```

### 2. Set Your Variables

Edit `terraform.tfvars`:

```hcl
key_name = "your-keypair-name"
```

Edit `variables.tf` if needed for region or AMI.

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate Configuration

```bash
terraform validate
```

### 5. Apply the Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

### 6. SSH into the Instance

```bash
ssh -i ~/Downloads/your-key.pem ubuntu@<public_ip_output>
```

Switch to user:

```bash
sudo su - harika
```

---

## 🧹 Cleanup

To destroy the resources when done:

```bash
terraform destroy
```

---

## 🔐 Security Notes

- Never use plaintext passwords in real-world scripts.
- Secure your key pairs and restrict IP access using Security Groups.

---

## 🙋‍♀️ Maintainer

Sreeharika Datla – *Terraform Beginner & Cloud Learner*