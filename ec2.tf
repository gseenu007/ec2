resource "aws_instance" "150212_TestProject_EC2" {
  ami           = "${var.ec2_150212_TestProject_EC2_ami}"
  instance_type = "${var.ec2_150212_TestProject_EC2_instance_type}"
  ebs_optimized = "false"
  disable_api_termination = "false"
  key_name = "${var.ec2_150212_TestProject_EC2_key_name}"
  get_password_data = "false"
  monitoring = "false"
  security_groups = ["${aws_security_group.allow_all.name}"]
  #vpc_security_group_ids = "${var.ec2_150212_TestProject_EC2_sg_1}"
  #subnet_id = "${var.ec2_150212_TestProject_EC2_subnet}"
  associate_public_ip_address = "true"
  source_dest_check = "true"
  root_block_device {
    volume_size = "${var.ec2_150212_TestProject_EC2_root_volume_size}"
    volume_type = "${var.ec2_150212_TestProject_EC2_root_volume_type}"
    delete_on_termination = "true" 
  }
  tags {
    TagName = "TagValue",
    Name = "150212_TestProject_EC2"
  }  
}

#data "aws_security_group" "selected" {
#  id = "${var.ec2_150212_TestProject_EC2_sg_1}"
#}

output "instance_150212_TestProject_EC2_id" {
  value = "${aws_instance.150212_TestProject_EC2.id}"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  #vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}
