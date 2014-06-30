require 'spec_helper'
require_relative '../lib/cloud_backup/dumper'

describe 'Dumper' do

  before { @settings_path = File.join(File.dirname(__FILE__), '../lib/settings.yml') }

  it 'should have settings.yml' do
    expect(File).to exist(@settings_path)
  end

  context 'setting values' do
    before do
      @settings = YAML.load_file(@settings_path)
    end

    it 'should have app key' do
      expect(@settings['dropbox']['app_key']).not_to be_nil
    end

    it 'should have app secret' do
      expect(@settings['dropbox']['app_secret']).not_to be_nil
    end

    it 'should have db user' do
      expect(@settings['database']['db_user']).not_to be_nil
    end

    it 'should have db name' do
      expect(@settings['database']['db_name']).not_to be_nil
    end

    it 'should have db password' do
      expect(@settings['database']['db_password']).not_to be_nil
    end

  end

end