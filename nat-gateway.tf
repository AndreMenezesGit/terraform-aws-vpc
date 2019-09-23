resource "aws_eip" "nat-gateway-eip" {
  count = length(aws_subnet.public_subnet)
  vpc   = true

  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_nat_gateway" "nat-gateway" {
  count         = length(aws_subnet.public_subnet)
  allocation_id = aws_eip.nat-gateway-eip.*.id[count.index]
  subnet_id     = aws_subnet.public_subnet.*.id[count.index]

  depends_on = ["aws_internet_gateway.igw"]
}