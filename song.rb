class Song
    attr_reader :name, :author, :length

    def initialize(name, author, length)
        @name = name
        @author = author
        @length = length
    end
end
