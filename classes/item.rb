require 'date' # Require the Date class

class Item
  attr_accessor  :archived, :label, :author, :source, :genre, :publish_date
  attr_reader :id

  def initialize(archived:false, publish_date: nil)
    @id = Random.rand(1..1000)
    @archived = archived
    @publish_date = Date.parse(publish_date) if publish_date
  end

  # a method that returns true if published date is older than 10 years
  def can_be_archived?
    return false unless publish_date
    current_date = Date.today
    time_to_be_archived = current_date.year - @publish_date.year
    time_to_be_archived > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

# item1 = Item.new(archived: true, publish_date: '2022-01-13')
# puts 'code executed successfully'
# item1.move_to_archive
# puts 'false, it is less than 10'
# item.archived
# puts 'archived'
# item1 = Item.new(true, '2022-01-13')
