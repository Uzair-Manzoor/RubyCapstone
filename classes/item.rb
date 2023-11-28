require 'date' # Require the Date class

class Item
  attr_accessor :id, :genre, :source, :label
  attr_reader :archived

  def initialize(genre, source, archived, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @source = source
    @label = label
    @archived = archived
    @publish_date = publish_date
  end

  # a method that returns true if published date is older than 10 years
  def can_be_archived?
    current_date = Date.today
    time_to_be_archived = current_date.year - @publish_date.year
    time_to_be_archived > 10
  end

  def move_to_archive
    @rchived = can_be_archived?
  end
end
