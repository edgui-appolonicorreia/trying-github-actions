# S3 Buckets file

/*
    Resource: S3 Bucket
    Name: Bronze layer
    Description: S3 Bucket to receive all raw data.
    Author: Edson G. A. Correia
*/
resource "aws_s3_bucket" "bronze-layer" {
    bucket = "bronze-layer-testing-ghactions"
    tags = {
        environment = "dev"
        project = "data-lake"
    }
}

# S3 Bucket ACL
resource "aws_s3_bucket_acl" "bronze-layer-acl" {
    bucket = aws_s3_bucket.bronze-layer.id
    acl = "private"
}

# S3 Bucket versioning
resource "aws_s3_bucket_versioning" "bronze-layer-versioning" {
    bucket = aws_s3_bucket.bronze-layer.id
    versioning_configuration {
        status = "Disabled"
    }
}

# Bucket public access block
resource "aws_s3_bucket_public_access_block" "public-block-bronze" {
    bucket = aws_s3_bucket.bronze-layer.id
    block_public_acls = true
    block_public_policy = true
    restrict_public_buckets = true
    ignore_public_acls = true
}
