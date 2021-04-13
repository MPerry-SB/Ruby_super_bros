require 'minitest/autorun'
require_relative '../lib/super_ruby_bros'

class Window
  class << self
    attr_reader :objects
  end

  def self.add(args)
    @objects ||= []
    @objects << args
  end
end

class SuperRubyBrosTest < Minitest::Test
  def test_game_boots
    game = SuperRubyBros.new
    game.run
    assert_equal [], Window.objects
  end
end
