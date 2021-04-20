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

  def get(sym, opts = nil); end

  def set(opts); end

  def on(event, &proc); end

  def off(event_descriptor); end

  def add(o)
    @objects << o
  end

  def remove(o)
    @objects.delete(o)
  end

  def clear
    @objects = []
  end

  def update
    yield
  end

  def show; end

  def close; end
end

class SuperRubyBrosTest < Minitest::Test
  def test_game_shows_one_hero_on_launch
    with_fake_window do |window|
      SuperRubyBros.new.run

      assert window.objects.one?(&hero?)
    end
  end

  def test_game_shows_all_assets_on_launch
    with_fake_window do |window|
      SuperRubyBros.new.run

      assert_equal 20, window.objects.count
      assert_equal 8, window.objects.count(&wood?)
      assert_equal 1, window.objects.count(&enemy?)
      assert_equal 1, window.objects.count(&enemy_collision_detection_square?)
    end
  end

  def test_game_looks_correct_on_launch
    skip
    with_fake_window do |window|
      SuperRubyBros.new.run

      contents = %(
C
L


O
------

          -------
      )

      assert_window_looks_like contents, window.objects
    end
  end

  def assert_window_looks_like contents, objects
  end

  def with_fake_window
    window = FakeWindow.new

    stub_const('Window', window)
    stub_const('Ruby2D::Window', window)

    yield window
  end

  private

  def hero?
    lambda do |object|
      object.is_a?(Ruby2D::Sprite) && object.path == './assets/hero.png'
    end
  end

  def wood?
    lambda do |object|
      object.is_a?(Ruby2D::Image) && object.path == './assets/wood.png'
    end
  end

  def enemy?
    lambda do |object|
      object.is_a?(Ruby2D::Image) && object.path == './assets/crab.png'
    end
  end

  def enemy_collision_detection_square?
    lambda do |object|
      object.is_a?(Ruby2D::Square)
    end
  end
end
