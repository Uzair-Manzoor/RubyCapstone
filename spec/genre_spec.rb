# require_relative '../classes/genre'
# require_relative '../classes/item'

# describe Genre do
#   let(:item) { Item.new(true, '2023-12-04') } # Replace Item with the actual class of items

#   describe '#add_item' do
#     it 'should add a new item to the items array' do
#       genre = Genre.new('name')
#       expect { genre.add_item(item) }.to change { genre.items.size }.by(1)
#     end

#     it 'should set the genre of the new item' do
#       genre = Genre.new('name')
#       genre.add_item(item)
#       expect(item.genre).to eq(genre)
#     end
#   end
# end
