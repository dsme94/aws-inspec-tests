control 'aws' do

  describe aws_cloudtrail_trail('insert_trail_name') do
    it { should exist }
    it { should be_encrypted }
    it { should be_multi_region_trail }
  end

  aws_vpcs.vpc_ids.each do |vpc_id|
    describe aws_flow_log(vpc_id: vpc_id) do
      it { should exist }
    end
    aws_security_groups.where(vpc_id: vpc_id).group_ids.each do |security_group_id|
      describe aws_security_group(security_group_id) do
        it { should_not allow_in port: 22 }
        it { should_not allow_in port: 3389 }
        it { should_not allow_in port: 5985 }
        it { should_not allow_in port: 5986 }
      end
    end
  end
  
  aws_subnets.subnet_ids.each do |subnet_id|
    describe aws_flow_log(vpc_id: subnet_id) do
      it { should exist }
    end
  end

  describe aws_iam_access_keys.where { created_days_ago > 90 } do
    it { should_not exist }
  end

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

end
