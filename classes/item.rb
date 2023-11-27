require 'date' # Require the Date class

class Item
  attr_accessor :id, :genre, :source, :label
  attr_reader :archived

  def initialize(id, genre, source, label, archived)
    @id = id
    @genre = genre
    @source = source
    @label = label
    @archived = archived
  end
end
