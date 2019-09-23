data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block = var.aws_vpc_cidr_block

  tags = {
    "Name"                                      = var.cluster-name,
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}
