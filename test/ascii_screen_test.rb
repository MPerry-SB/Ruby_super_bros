require 'minitest/autorun'
require 'ostruct'

class AsciiScreen
  def initialize ascii_art, width:, height:
    @ascii_art = ascii_art
    @width = width
    @height = height
    @number_of_rows = ascii_art.split("\n").count
    @number_of_columns = ascii_art.split("\n").first.chars.count

    @pixel_width = @height / @number_of_rows
    @pixel_height = @width / @number_of_columns
  end

  def to_a
    @ascii_art
      .split("\n")
      .each_with_index
      .flat_map do |row, row_index|
        row
          .chars
          .each_with_index.map do |_, column_index|
            OpenStruct.new(path: './assets/wood.png', x: column_index * @pixel_width, y: row_index * @pixel_height)
          end
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

  def test_two_sprites_return_different_x_and_ys_with_double_height
    objects = AsciiScreen.new("-\n-", width: 2, height: 4).to_a
    expected_objects = [
      OpenStruct.new(path: './assets/wood.png', x: 0, y: 0),
      OpenStruct.new(path: './assets/wood.png', x: 0, y: 2)
    ]
    assert_equal expected_objects, objects
  end
end