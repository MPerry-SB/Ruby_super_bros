class Player

  attr_reader :square, :lives
  attr_writer :reset, :hard_reset
  attr_accessor :jumper_state, :touching_platform, :y, :x, :platform_height, :coins, :player, :hero



  def initialize
    @jumper_state = 'grounded'
    @jump_height = 110
    @direction = nil
    @x = 40
    @y = Window.height - 80
    @platform_height = 0
    @reset = false
    @hard_reset = false
    @coins = 0
    @lives = 3
    @touching_platform = false
    @death_sound = Sound.new('./assets/death.wav')
    @hero = Sprite.new('./assets/hero.png', z: 5, clip_width: 33, height: 57, width: 33)

  end

  def draw
    @square = Rectangle.new(x: @x, y: @y, color: 'blue', width: 33, height: 47)
    @coin_counter = Text.new("Coins: #{@coins}", z: 4, x: 10, color: 'red')
    @lives_counter = Text.new("Lives: #{@lives}", z: 4, x: 10, y: 25, color: 'red')
  end

  def reset
    if @reset
      @x = 40
      @y = Window.height - 50
      @reset = false
    end
  end

  def hard_reset
    if @hard_reset
      @x = 40
      @y = Window.height - 50
      @hard_reset = false
      @lives = 3
      @coins = 0
    end
  end

  def jump
    if @y < (@platform_height - @jump_height)
      @jumper_state = nil
      @platform_height = 0
    elsif @jumper_state == :jumping
      @y -= 15
    end
  end

  def touching_platform?
    if @platform_height == @y
      true
    end
  end

def checks_if_falling
  if touching_platform? == true
    @jumper_state = 'grounded'
  elsif @y > @platform_height
    @jumper_state = nil
  end
end

def fall_death
  if @y > Window.height
    lose_life
    @death_sound.play
  end
end

def lose_life
  @reset = true
  @lives -= 1
end

def gravity
    @y += 7
end

def landed_on_platform
  @platform_height = @y
  @y -= 7
  @touching_platform = true
end

end
