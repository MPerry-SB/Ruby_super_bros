require 'minitest/autorun'
require 'rspec/mocks/minitest_integration'
require_relative '../lib/super_ruby_bros'

class FakeWindow
  def set args
  end

  def show
  end

  def height
    200
  end

  def width
    300
  end

  def on arg
  end

  def update
  end
end

class SuperRubyBrosTest < Minitest::Test
  def test_game_boots
    fake_window = FakeWindow.new
    stub_const("Window", fake_window)
    game = SuperRubyBros.new
    game.run
    assert true
  end
end