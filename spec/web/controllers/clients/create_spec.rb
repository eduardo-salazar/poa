require 'spec_helper'
require_relative '../../../../apps/web/controllers/clients/create'

describe Web::Controllers::Clients::Create do
  let(:action) { Web::Controllers::Clients::Create.new }
  let(:params) { Hash[client: { name: 'Cliente name', desc: 'Desc cliente', location: 'Managua'}] }

  before do
    ClientRepository.new.clear
  end

  it 'creates a new client' do
    action.call(params)
    action.clients.id.wont_be_nil
    action.clients.name.must_equal params[:client][:name]
  end

  it 'redirects the user to the clients listing' do
    response = action.call(params)
    response[0].must_equal 302
    response[1]['Location'].must_equal '/clients'
  end

end
