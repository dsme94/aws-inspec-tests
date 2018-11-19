control 'aws' do

  title 'Check that cloudtrail is enabled in all regions'
  describe aws_cloudtrail_trail('insert_trail_name') do
    it { should exist }
    it { should be_encrypted }
    it { should be_multi_region_trail }
  end

  title 'Check that all VPCs have flow logs enabled and that the security groups don\'t allow 22, 3389, 5985 and 5986 inbound from the internet'
  aws_vpcs.vpc_ids.each do |vpc_id|
    describe aws_flow_log(vpc_id: vpc_id) do
      it { should exist }
    end
    aws_security_groups.where(vpc_id: vpc_id).group_ids.each do |security_group_id|
      describe aws_security_group(security_group_id) do
        it { should_not allow_in port: 22, ipv4_range: '0.0.0.0/0'}
        it { should_not allow_in port: 3389, ipv4_range: '0.0.0.0/0' }
        it { should_not allow_in port: 5985, ipv4_range: '0.0.0.0/0' }
        it { should_not allow_in port: 5986, ipv4_range: '0.0.0.0/0' }
      end
    end
  end

  title 'Check that all subnets have flow logs enabled'
  aws_subnets.subnet_ids.each do |subnet_id|
    describe aws_flow_log(vpc_id: subnet_id) do
      it { should exist }
    end
  end

  title 'Check that IAM access keys are not older than 90 days'
  describe aws_iam_access_keys.where { created_days_ago > 90 } do
    it { should_not exist }
  end

  title 'Check the IAM password policy'
  describe aws_iam_password_policy do
    it { should require_lowercase_characters }
    it { should require_uppercase_characters }
    it { should require_symbols }
    it { should require_numbers }
    its('minimum_password_length') { should be > 8 }
    it { should allow_users_to_change_passwords }
    it { should expire_passwords }
    it { should prevent_password_reuse }
  end

  title 'Check for encrypted volumes and unused'
  aws_ebs_volumes.volume_ids.each do |volume_id|
    describe aws_ebs_volume(volume_id) do
      it { should be_encrypted }
      its('state') { should eq 'in-use' }
    end
  end

end
