resource "aws_iam_role_policy_attachment" "s3_attach" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.s3_role.name
}
