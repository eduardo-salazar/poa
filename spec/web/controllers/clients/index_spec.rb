require 'spec_helper'
require_relative '../../../../apps/web/controllers/clients/index'

describe Web::Controllers::Clients::Index do
  let(:action) { Web::Controllers::Clients::Index.new }
  let(:params) { Hash[] }
  let(:repository) {ClientRepository.new}

  before do
    repository.clear

    @clients = repository.create(name: 'Client1', desc: 'Description Client1', location:'Managua')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all clients' do
    action.call(params)
    action.exposures[:clients].must_equal [@clients]
  end
end
