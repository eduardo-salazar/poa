require 'features_helper'

describe 'Add client' do
  after do
    ClientRepository.new.clear
  end

  it 'can create a new client' do
    visit 'clients/new'

    within 'form#client-form' do
      fill_in 'name', with: 'New Client'
      fill_in 'desc', with: 'Description new client'
      fill_in 'location', with: 'Managua'
      click_button 'Create'
    end

    current_path.must_equal('/clients')
    assert page.has_content?('New Client')
  end
end
