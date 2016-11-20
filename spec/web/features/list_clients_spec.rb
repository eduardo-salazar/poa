require 'features_helper'

describe 'List clients' do
  it 'checks if there are at least two clients on the page' do
    visit '/clients'

    within '#clients' do
      assert page.has_css?('.client', count: 2), 'Expected to find 2 clients'
    end
  end
end
