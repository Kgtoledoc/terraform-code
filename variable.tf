variable "port" {
    description = "The port to expose on the server"
    type = number
    default = 8080
}

variable "region" {
    description = "The region for deployment"
    type = string
    default="us-east-2"
}

# To override the variable runtime

# terraform apply -var="port=8081"
# export TF_VAR_port=8081