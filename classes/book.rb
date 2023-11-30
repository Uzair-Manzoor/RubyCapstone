require_relative 'item'

class Book < Item
    attr_accessor :publisher, :cover_state

    def initialize(publisher, cover_state)
    super(archived, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    end

    def can_be_archived?
    super || cover_state == 'bad'
    end

end

book1 = Book.new('joy', 'bad')
book1.cover_state = 'bad'
book1.can_be_archived
puts 'bad'