require 'spec_helper'

describe 'newrelic::repo::infra', :type => :class do

  context 'OS Family => RedHat' do
    let(:facts) do
      {
        'os' => {
          'family'  => 'RedHat',
          'name'    => 'CentOS',
          'release' => {
            'major' => '7'
          }
        }
     }
     end

    it { is_expected.to compile }
    it { should contain_yumrepo('newrelic-infra') }
  end

  context 'OS Family => Debian' do
    let(:facts) do
      {
        'lsbdistcodename' => 'wheezy',
        'osfamily'        => 'Debian',
        'os'              => {
            'family'  => 'Debian',
            'name'    => 'Debian',
            'release' => {
              'full' => '7.0'
            }
        },
     }
     end

    it { is_expected.to compile }
    it { should contain_apt__source('newrelic-infra') }
    it { should contain_package('apt-transport-https') }
  end


end
