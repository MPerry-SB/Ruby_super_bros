require 'minitest/autorun'
require 'rspec/mocks/minitest_integration'
require_relative '../lib/super_ruby_bros'


class FakeWindow
  attr_reader :objects

  def initialize
    @objects = []
  end

  def height
    200
  end

  def width
    300
  end

  def get(sym, opts = nil)
  end

  def set(opts)
  end

  def on(event, &proc)
  end

  def off(event_descriptor)
  end

  def add(o)
    @objects << o
  end

  def remove(o)
    @objects.delete(o)
  end

  def clear
    @objects = []
  end

  def update(&proc)
    yield
  end

  def show
  end

  def close
  end
end

class SuperRubyBrosTest < Minitest::Test
  def test_game_shows_one_hero_on_launch
    fake_window = FakeWindow.new

    stub_const("Window", fake_window)
    stub_const("Ruby2D::Window", fake_window)

    game = SuperRubyBros.new
    game.run

    assert fake_window.objects.one?(&hero?)
  end

  private

  def hero?
    lambda do |object|
      object.is_a?(Ruby2D::Sprite) && object.path == './assets/hero.png'
    end
  end
end