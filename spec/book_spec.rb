require_relative '../classes/book'
require_relative '../classes/item'


RSpec.describe Item do
   describe '#can_be_archived?' do
    context 'when publish date is nil' do
      let(:item) { Item.new(false, nil) }

      it 'returns false' do
        expect(item.can_be_archived?).to be false
      end
    end

    # ... other test contexts ...
  end

  describe '#move_to_archive' do
    let(:publish_date) { (Date.today - 12 * 365).to_s } # 12 years ago
    let(:item) { Item.new(false, publish_date) }

    it 'archives the item if it can be archived' do
      item.move_to_archive
      expect(item.archived).to be true
    end

    it 'does not archive the item if it cannot be archived' do
      allow(item).to receive(:can_be_archived?).and_return(false)
      item.move_to_archive
      expect(item.archived).to be false
    end
  end
end

RSpec.describe Book do
  describe '#can_be_archived?' do
    # ... your test contexts for Book class ...
  end
end
