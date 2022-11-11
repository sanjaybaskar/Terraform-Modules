# store the terraform state file in s3

terraform {
    backend "s3" {
       bucket = "sk-terraform-data"
    key = "jupiter-website-ecs.tfstate"
    region = "ap-south-1"
    #profile = "sanjay.baskar"
    }
   
}