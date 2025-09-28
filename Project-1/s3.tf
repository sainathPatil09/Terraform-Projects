resource "aws_s3_bucket" "portfolio_bucket" {
  bucket = "sainath-portfolio-terraform"
  # bucket = "wiings-my-portfolio"

  tags = {
    Name = "My Portfolio Website"
  }

}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.portfolio_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "website_files" {
  for_each = fileset("dist", "**")

  bucket = aws_s3_bucket.portfolio_bucket.id
  key    = each.value
  source = "dist/${each.value}"
  etag   = filemd5("dist/${each.value}")
  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
      png  = "image/png"
      jpg  = "image/jpeg"
      jpeg = "image/jpeg"
      svg  = "image/svg+xml"
    },
    regex("[^.]+$", each.value),
    "binary/octet-stream"
  )
}
