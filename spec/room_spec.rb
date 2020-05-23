require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")

class TestRoom < MiniTest::Test
    def setup
        @room1 = Room.new()
        @guest1 = Guest.new("Alice")
        @guest2 = Guest.new("Bob")
        @guest3 = Guest.new("Carl")
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
end
