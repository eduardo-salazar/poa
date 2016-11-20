require 'features_helper'

describe 'List clients' do
  it 'displays list of clients on the page' do
    visit '/books'

    within '#clients' do
      asset page.has_css?('.client', count: 2), 'Expected to find 2 clients'
    end
  end
end