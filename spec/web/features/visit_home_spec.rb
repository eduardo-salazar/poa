require 'features_helper'

describe 'Visit Home' do
  it 'is successfull' do
    visit '/'

    page.body.must_include('Welcome')
  end
end
