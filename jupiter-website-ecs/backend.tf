# store the terraform state file in s3

terraform {
    backend = "sk-terraform_data"
    key = "jupiter-website-ecs.tfstate"
    region = "ap-south-1"
    profile = "sanjay.baskar"
}