resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.cluster-name
  }

  depends_on = ["aws_vpc.vpc"]
}