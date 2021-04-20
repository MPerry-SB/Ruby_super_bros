require 'minitest/autorun'
require 'ostruct'

class AsciiScreen
  def initialize ascii_art
  end

  def to_a
    [OpenStruct.new(path: './assets/wood.png')]
  end
end

class AsciiScreenTest < Minitest::Test
  def test_returns_wood
    objects = AsciiScreen.new('-').to_a
    assert_equal [OpenStruct.new(path: './assets/wood.png')], objects
  end
end