require 'features_helper'

describe 'List clients' do
  let(:repository) { ClientRepository.new }
  before do
    repository.clear

    repository.create(name: 'Cliente 1', desc: 'Cliente 1', location: 'Managua')
    repository.create(name: 'Cliente 2', desc: 'Cliente 2', location: 'Esteli')
    repository.create(name: 'Cliente 3', desc: 'Cliente 3', location: 'Boaco')
    repository.create(name: 'Cliente 4', desc: 'Cliente 4', location: 'Matagalpa')
  end

  it 'checks if there are at least four clients on the page' do
    visit '/clients'

    within '#clients' do
      assert page.has_css?('.client', count: 4), 'Expected to find 2 clients'
    end
  end
end
