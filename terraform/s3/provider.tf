provider "aws" {
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "private-iam"

  region = "ap-northeast-1"
}
