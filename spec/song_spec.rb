require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song")

class TestSong < MiniTest::Test
    def test_song_initialize
        song = Song.new("Sweet Caroline", "Neil Diamond", 3.21)
        assert_equal("Sweet Caroline", song.name)
        assert_equal("Neil Diamond", song.author)
        assert_equal(3.21, song.length)
    end
end
