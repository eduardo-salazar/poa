require 'spec_helper'
require_relative '../../../../apps/web/controllers/clients/create'

describe Web::Controllers::Clients::Create do
  let(:action) { Web::Controllers::Clients::Create.new }
  let(:params) { Hash[] }

  before do
    ClientRepository.new.clear
  end

  it 'creates a new client' do
    action.call(params)

    action.client.id.wont_be_nil
    action.client.name.must_equal params[:client][:name]
  end

  it 'redirects the user to the books listing' do
    response = action.call(params)
    response[0].must_equal 302
    response[1]['Location'].must_equal '/clients'
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
