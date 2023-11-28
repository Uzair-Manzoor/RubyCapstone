require './item'
class MusicAlbum < Item
  def initialize(on_spotify)
    super(genre, source, label, publish_date)
    @on_spotify = on_spotify
  end

  # a method to override the default can_be_archived mrthod inthe parent class
  # and return true if the can_be_archived is true and on_spotify is true else false
  def can_be_archived?
    super.can_be_archived? && @on_spotify
  end
end
