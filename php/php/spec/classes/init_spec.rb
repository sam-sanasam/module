require 'spec_helper'
describe 'php' do
  context 'with default values for all parameters' do
    it { should contain_class('php') }
  end
end
