# aws-inspec-tests



## Usage

`inspec exec FOLDER_NAME -t aws://`

*`example: inspec exec security_tests/aws -t aws://`*


## Snippet

```

Profile: InSpec Profile (aws)
Version: 0.1.0
Target:  aws://

[38;5;9m  ×  aws: CloudTrail insert_trail_name (13 failed)[0m
[38;5;9m     ×  CloudTrail insert_trail_name should exist
     expected CloudTrail insert_trail_name to exist[0m
[38;5;9m     ×  CloudTrail insert_trail_name should be encrypted
     expected `CloudTrail insert_trail_name.encrypted?` to return true, got false[0m
[38;5;9m     ×  CloudTrail insert_trail_name should be multi region trail
     expected `CloudTrail insert_trail_name.multi_region_trail?` to return true, got nil[0m
[38;5;9m     ×  AWS Flow Log vpc-00000000000000000 should exist
     expected AWS Flow Log vpc-00000000000000000 to exist[0m
[38;5;9m     ×  EC2 Security Group sg-00000000000000000 should not allow in {:port=>22}
     expected `EC2 Security Group sg-00000000000000000.allow_in?({:port=>22})` to return false, got true[0m
[38;5;9m     ×  EC2 Security Group sg-00000000000000000 should not allow in {:port=>3389}
     expected `EC2 Security Group sg-00000000000000000.allow_in?({:port=>3389})` to return false, got true[0m
[38;5;9m     ×  EC2 Security Group sg-00000000000000000 should not allow in {:port=>5985}
     expected `EC2 Security Group sg-00000000000000000.allow_in?({:port=>5985})` to return false, got true[0m
[38;5;9m     ×  EC2 Security Group sg-00000000000000000 should not allow in {:port=>5986}
     expected `EC2 Security Group sg-00000000000000000.allow_in?({:port=>5986})` to return false, got true[0m

[38;5;41m     ✔  EC2 Security Group sg-11111111111111111 should not allow in {:port=>22}[0m
[38;5;41m     ✔  EC2 Security Group sg-11111111111111111 should not allow in {:port=>3389}[0m
[38;5;41m     ✔  EC2 Security Group sg-11111111111111111 should not allow in {:port=>5985}[0m
[38;5;41m     ✔  EC2 Security Group sg-11111111111111111 should not allow in {:port=>5986}[0m
[38;5;9m     ×  AWS Flow Log subnet-0000000000000 should exist
     expected AWS Flow Log subnet-0000000000000 to exist[0m
[38;5;9m     ×  AWS Flow Log subnet-11111111111111 should exist
     expected AWS Flow Log subnet-11111111111111 to exist[0m
[38;5;9m     ×  IAM Access Keys with created_days_ago > 90 should not exist
     expected IAM Access Keys with created_days_ago > 90 not to exist[0m
[38;5;41m     ✔  IAM Password-Policy should require lowercase characters[0m
[38;5;41m     ✔  IAM Password-Policy should require uppercase characters[0m
[38;5;41m     ✔  IAM Password-Policy should require symbols[0m
[38;5;41m     ✔  IAM Password-Policy should require numbers[0m
[38;5;41m     ✔  IAM Password-Policy should allow users to change passwords[0m
[38;5;9m     ×  IAM Password-Policy should expire passwords
     expected `IAM Password-Policy.expire_passwords?` to return true, got false[0m
[38;5;41m     ✔  IAM Password-Policy should prevent password reuse[0m
[38;5;41m     ✔  IAM Password-Policy minimum_password_length should be > 8[0m


Profile Summary: 0 successful controls, [38;5;9m1 control failure[0m, 0 controls skipped
Test Summary: [38;5;41m6 successful[0m, [38;5;9m13 failures[0m, 0 skipped
```
