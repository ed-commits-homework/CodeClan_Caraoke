require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < MiniTest::Test
    def setup
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
    end

    def test_room_initialize
        assert_equal([], @room1.guests)
    end

    def test_check_in__1
        @room1.check_in(@guest1)
        assert_equal(1, @room1.guests.length)
    end

    def test_check_in__2
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        assert_equal(2, @room1.guests.length)
    end

    def test_check_in__3
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        assert_equal(3, @room1.guests.length)
    end

    def test_check_in_and_check_out_one_guest
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        @room1.check_out(@guest2)
        assert_equal(2, @room1.guests.length)
    end

    def test_check_in_and_check_out_everyone
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        @room1.check_out(@guest2)
        @room1.check_out(@guest1)
        @room1.check_out(@guest3)
        assert_equal(0, @room1.guests.length)
    end

    def test_check_in__4_over_capacity
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        @room1.check_in(@guest4)
        assert_equal(3, @room1.guests.length)
    end

    def test_add_song
        @room1.add_song(@song4)
        assert_equal(3, @room1.playlist.length)
        assert_equal(true, @room1.playlist.include?(@song4))
    end

    def test_check_in__check_balance
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        assert_equal(36, @room1.balance)
    end

    def test_current_song_name
        assert_equal("Sweet Caroline", @room1.current_song_name)
    end

    def test_audience
        @room1.check_in(@guest1)
        @room1.check_in(@guest2)
        @room1.check_in(@guest3)
        assert_nil(@room1.survey_audience)
    end
end
