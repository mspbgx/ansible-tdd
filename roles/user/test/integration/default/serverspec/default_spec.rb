require 'serverspec'

describe user('ansible') do
  it { should exist}
  it { should belong_to_group 'ansible'}
end
