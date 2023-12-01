require 'date'
require_relative '../classes/item'
require_relative '../classes/author'

describe Author do
  let(:author) do
    Author.new(1, 'Ahmad', 'Ahmadi')
  end

  before(:each) do
    @item1 = Item.new(11, 'Title', Date.new(2020,01,01))
  end
  describe 'When testing the Author class' do
    it 'Sets the first_name attribute' do
      expect(author.first_name).to eq('Ahmad')
    end
    it 'Sets the last_name attribute' do
      expect(author.last_name).to eq('Ahmadi')
    end

  end

end
