#!/bin/bash

yum update -y
yum install -y docker
systemctl enable docker.service
systemctl start docker.service
usermod -aG docker ec2-user