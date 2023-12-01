require_relative '../classes/music_album'
require_relative '../classes/item'

describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when both can_be_archived? and on_spotify are true' do
      it 'returns true' do
        music_album = MusicAlbum.new(1, 'name', '2023-12-01', true)
        allow(music_album).to receive(:can_be_archived?).and_return(true)

        expect(music_album.can_be_archived?).to be(true)
      end
    end

    context 'when can_be_archived? is false' do
      it 'returns false' do
        music_album = MusicAlbum.new(1, 'name', '2023-12-01', true)
        allow(music_album).to receive(:can_be_archived?).and_return(false)

        expect(music_album.can_be_archived?).to be(false)
      end
    end
    context 'when on_spotify is false' do
      it 'returns false' do
        music_album = MusicAlbum.new(1, 'name', '2023-12-01', false)
        allow(music_album).to receive(:can_be_archived?).and_return(false)

        expect(music_album.can_be_archived?).to be(false)
      end
    end
  end
end
