require_relative 'item'

class Book < Item
    attr_accessor :publisher, :cover_state, :publish_date
    attr_reader :id

    def initialize(publisher, cover_state, archived, publish_date)
    super(archived, publish_date)
    @id = rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
    end

    def can_be_archived?
    super || cover_state == 'bad'
    end

end
