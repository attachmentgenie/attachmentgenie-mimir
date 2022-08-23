require 'spec_helper'
describe 'mimir' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with defaults for all parameters' do
        it { is_expected.to contain_class('mimir') }
        it { is_expected.to contain_class('mimir::install').that_comes_before('Class[mimir::Config]') }
        it { is_expected.to contain_class('mimir::config').that_notifies('Class[mimir::Service]') }
        it { is_expected.to contain_class('mimir::service') }
        it { is_expected.to contain_group('mimir') }
        it { is_expected.to contain_package('mimir') }
        it { is_expected.to contain_service('mimir') }
        it { is_expected.to contain_user('mimir') }
      end
    end
  end
end
