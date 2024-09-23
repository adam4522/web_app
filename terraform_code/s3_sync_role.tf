resource "aws_iam_policy" "iam_sync_s3_policy" {
  name        = "iam_sync_s3_policy"
  path        = "/"
  description = "iam_sync_s3_policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}













resource "aws_iam_role" "aws_s3_sync_role" {
  name = "aws_s3_sync_role"

 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
    Name ="aws_s3_sync_role"
  }
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.aws_s3_sync_role.name
  policy_arn = aws_iam_policy.iam_sync_s3_policy.arn
}