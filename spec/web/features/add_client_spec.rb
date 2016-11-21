require 'features_helper'

describe 'Add client' do
  after do
    ClientRepository.new.clear
  end

  it 'can create a new client' do
    visit 'clients/new'

    within 'form#client-form' do
      fill_in 'Name', with: 'New Client'
      fill_in 'Description', with: 'Description new client'
      fill_in 'Location', with: 'Managua'
      click_button 'Create'
    end

    current_path.must_equal('/clients')
    assert page.has_content?('New Client')
  end

  it 'displays list of errors when params contains erros' do
    visit 'clients/new'

    within 'form#client-form' do
      click_button 'Create'
    end

    current_path.must_equal('/clients')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Name must be filled')
    assert page.has_content?('Desc must be filled')
    assert page.has_content?('Location must be filled')
  end
end
