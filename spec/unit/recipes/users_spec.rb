require 'spec_helper'

describe 'lcd_web::users' do
  context 'CentOS' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'creates the group' do
      expect(chef_run).to create_group('developers')
    end

    it 'creates the user' do
      expect(chef_run).to create_user('webadmin').with(group: 'developers')
    end
  end
end
