# Creating reusable variables to use in main.tf

variable "vpc_id" {
        type = string
        default = "vpc-07e47e9d90d2076da"
}

variable "name" {
        type = string
        default = "Eng67.Mehdi.Node.App"
}


variable "app_ami_id" {
        type = string
        default = "ami-0135eaf9586569464"
}
