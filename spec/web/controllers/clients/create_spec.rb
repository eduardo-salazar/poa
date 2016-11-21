require 'spec_helper'
require_relative '../../../../apps/web/controllers/clients/create'

describe Web::Controllers::Clients::Create do
  let(:action) { Web::Controllers::Clients::Create.new }


  before do
    ClientRepository.new.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[client: { name: 'Cliente name', desc: 'Desc cliente', location: 'Managua'}] }

    it 'creates a new client' do
      action.call(params)
      action.clients.id.wont_be_nil
    end

    it 'redirects the user to the clients listing' do
      response = action.call(params)
      response[0].must_equal 302
      response[1]['Location'].must_equal '/clients'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[client: {}]}

    it 're-renders the clients#new view' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'sets errors attribute accordingly' do
      response = action.call(params)
      response[0].must_equal 422

      action.params.errors[:client][:name].must_equal ['is missing']
      action.params.errors[:client][:desc].must_equal ['is missing']
      action.params.errors[:client][:location].must_equal ['is missing']

    end
  end

end
