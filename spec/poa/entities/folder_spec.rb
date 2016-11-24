require 'spec_helper'

describe Folder do
  # place your tests here
  it 'can be initialised with attributes required' do
    client = Client.new(name: 'Client1', desc: 'Description', location: 'Managua')
    #create folders
    folder = folder.new(name: 'Economia', desc: 'Curso de economia para parte sur')
    folder.name.must_equal 'Economia'
  end
end
