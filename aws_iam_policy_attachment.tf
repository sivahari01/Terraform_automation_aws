resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.s3_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}
