require 'spec_helper'
require_relative '../../../../apps/web/controllers/clients/index'

describe Web::Controllers::Clients::Index do
  let(:action) { Web::Controllers::Clients::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
