# iam policy

resource "aws_iam_policy" "default" {
  name   = var.iam_policy_name
  policy = var.iam_policy
  tags   = var.iam_policy_tags
}

# iam role

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "default" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.iam_role_tags
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

resource "aws_iam_instance_profile" "default" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.default.name
}
