require 'spec_helper'
require_relative '../../../../apps/web/views/clients/index'

describe Web::Views::Clients::Index do
  let(:exposures) { Hash[clients: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/clients/index.html.erb') }
  let(:view)      { Web::Views::Clients::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #clients' do
    view.foo.must_equal exposures.fetch(:clients)
  end

  describe 'when there are no clients' do
    it 'shows a placeholder message' do
      rendered.must_include('There are no clients yet')
    end
  end

  describe 'where there are clients' do
    let(:book1){Client.new(name: 'Cliente 1', desc: 'Description Cliente 1', location: 'Managua')}
    let(:book2){Client.new(name: 'Cliente 2', desc: 'Cliente 2', location: 'Esteli')}
    let(:book3){Client.new(name: 'Cliente 3', desc: 'Cliente 3', location: 'Boaco')}
    let(:book4){Client.new(name: 'Cliente 4', desc: 'Cliente 4', location: 'Matagalpa')}
    let(:exposures) {Hash[books: [book1,book2,book3,book4]]}

    it 'list all clients' do
      rendered.scan(/class='client').count.must_equal 4
      redenred.must_include('Client1')
      redenred.must_include('Description Cliente 1')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('There are no clients yet')
    end
  end
end
