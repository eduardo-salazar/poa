require 'spec_helper'

describe Client do
  # place your tests here
  describe Client do
    it 'can be initialised with attributes required' do
      client = Client.new(name: 'Client1')
      client.name.must_equal 'Client1'
    end
  end
end
