require 'date' # Require the Date class

class Item
  attr_accessor :id, :source, :label
  attr_reader :archived

  def initialize(archived, publish_date)
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

  # a setter method for genre items does not include the genre
  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end
end
