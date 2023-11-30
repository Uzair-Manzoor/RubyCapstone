require_relative 'item'

class MusicAlbum < Item
  attr_reader :id, :publish_date, :archived

  def initialize(archived, publish_date, on_spotify)
    super(archived, publish_date)
    @id = id
    @on_spotify = on_spotify
  end

  # a method to override the default can_be_archived mrthod inthe parent class
  # and return true if the can_be_archived is true and on_spotify is true else false
  def can_be_archived?
    super.can_be_archived? && @on_spotify
  end
end
