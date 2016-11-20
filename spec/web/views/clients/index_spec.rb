require 'spec_helper'
require_relative '../../../../apps/web/views/clients/index'

describe Web::Views::Clients::Index do
  let(:exposures) { Hash[clients: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/clients/index.html.erb') }
  let(:view)      { Web::Views::Clients::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #clients" do
    view.clients.must_equal exposures.fetch(:clients)
  end

  describe 'when there are no clients' do
    it 'shows a placeholder message' do
      rendered.must_include('There are no clients yet')
    end
  end

  describe 'where there are clients' do
    let(:client1){Client.new(name: 'Cliente 1', desc: 'Description Cliente 1', location: 'Managua')}
    let(:client2){Client.new(name: 'Cliente 2', desc: 'Cliente 2', location: 'Esteli')}
    let(:client3){Client.new(name: 'Cliente 3', desc: 'Cliente 3', location: 'Boaco')}
    let(:client4){Client.new(name: 'Cliente 4', desc: 'Cliente 4', location: 'Matagalpa')}
    let(:exposures) {Hash[clients: [client1,client2,client3,client4]]}

    it 'list four clients' do
      rendered.scan(/class='client'/).count.must_equal 4
    end

    it 'check name and desc' do
      rendered.must_include('Cliente 1')
      rendered.must_include('Description Cliente 1')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('There are no clients yet')
    end
  end
end
