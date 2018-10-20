describe user('webadmin') do
    it { should exist }
    its('group') { should eq 'developers' }
end 

describe group('developers') do
    it { should exist }
end
