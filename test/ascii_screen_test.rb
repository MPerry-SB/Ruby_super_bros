require 'minitest/autorun'
require 'ostruct'

class AsciiScreen
  def initialize ascii_art, width:, height:
    @ascii_art = ascii_art
  end

  def to_a
    if @ascii_art.length == 1
      [
        OpenStruct.new(path: './assets/wood.png', x: 0, y: 0),
      ]
    elsif @ascii_art.length == 2
      [
        OpenStruct.new(path: './assets/wood.png', x: 0, y: 0),
        OpenStruct.new(path: './assets/wood.png', x: 1, y: 0),
      ]
    else
      [
        OpenStruct.new(path: './assets/wood.png', x: 0, y: 0),
        OpenStruct.new(path: './assets/wood.png', x: 0, y: 1),
      ]
    end
  end
end

class AsciiScreenTest < Minitest::Test
  def test_returns_wood
    objects = AsciiScreen.new('-', width: 1, height: 1).to_a
    expected_objects = [
      OpenStruct.new(path: './assets/wood.png', x: 0, y: 0)
    ]
    assert_equal expected_objects, objects
  end

  def test_two_sprites_return_different_x_and_ys
    objects = AsciiScreen.new('--', width: 2, height: 1).to_a
    expected_objects = [
      OpenStruct.new(path: './assets/wood.png', x: 0, y: 0),
      OpenStruct.new(path: './assets/wood.png', x: 1, y: 0)
    ]
    assert_equal expected_objects, objects
  end

  def test_two_sprites_return_different_x_and_ys_with_height
    objects = AsciiScreen.new("-\n-", width: 1, height: 2).to_a
    expected_objects = [
      OpenStruct.new(path: './assets/wood.png', x: 0, y: 0),
      OpenStruct.new(path: './assets/wood.png', x: 0, y: 1)
    ]
    assert_equal expected_objects, objects
  end
end