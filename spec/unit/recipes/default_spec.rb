#
# Cookbook:: python
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'python::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'updated all sources' do
      expect(chef_run).to update_apt_update('update')
    end

    it 'should add python_pip3 to the source list' do
      expect(chef_run).to install_package('python3-pip')
    end

    it 'should add libncurses5-dev to the source list' do
      expect(chef_run).to install_package('libncurses5-dev')
    end
  end
end
