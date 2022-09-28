terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #access_key = "AKIAT7EVD2KBERXXXXX"
  #secret_key = "rnucH1/Th8CHKIgPa4W+PCYEEZXXXXXXXXXX"
}


resource "aws_s3_bucket" "log_bucket" {
  bucket = "dos-07-hw35-p3-2325-log"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "bucket-site" {
  bucket = "dos-07-hw35-p3-2325"
  acl    = "public-read"
  policy = data.aws_iam_policy_document.website_policy.json
  website {
    index_document = "index.html"
    error_document = "error.html"
   }
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }
   

}

resource "aws_s3_bucket_object" "upload_file" {
  bucket = aws_s3_bucket.bucket-site.id
  key    = "index.html"
  acl    = "public-read"
  source = "index.html"
  content_type = "text/html"

}

data "aws_iam_policy_document" "website_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::dos-07-hw35-p3-2325/*"
    ]
  }
}