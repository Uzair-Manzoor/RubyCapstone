require_relative '../classes/label'
require_relative '../classes/item'

RSpec.describe Label do
  describe '#add_item' do
    let(:label) { Label.new('Test Label', 'blue') }
    let(:item) { Item.new(false, '2010-01-01') } # Example item with a publish date

    it 'adds an item to the label' do
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'sets the label of the added item to itself' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
