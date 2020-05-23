require_relative("room")
require_relative("guest")
require_relative("song")

@guest1 = Guest.new("Alice", 35)
@guest2 = Guest.new("Bob", 15)
@guest3 = Guest.new("Carl", 22, "Sweet Caroline")
@guest4 = Guest.new("David", 33)

@song1 = Song.new("Sweet Caroline", "Neil Diamond", 3.21)
@song2 = Song.new("Don't Stop Believin'", "Journey", 4.11)
@song3 = Song.new("Bohemian Rhapsody", "Queen", 5.55)
@song4 = Song.new("Wonderwall", "Oasis", 4.19)
@song5 = Song.new("My Way", "Frank Sinatra", 4.35)

@songs = [@song1,@song2,@song3]
@room1 = Room.new(3, @songs)

@room1.guests = [@guest1,@guest2,@guest3]
@room1.survey_audience

# The default favorite song is Bohemian Rhapsody
# The 3rd guest's favorite song is Sweet Caroline
# Since this is the currently playing song only one of the 3 guests in the guests array cheers
# Here is the result of executing the program:

# $ ruby main.rb 
# ...
# ...
# Whoo!
