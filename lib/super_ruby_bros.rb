require 'ruby2d'
require_relative 'player'
require_relative 'sounds'
require_relative 'level_one'
require_relative 'level_two'
require_relative 'level_three'
require_relative 'win_screen'

class SuperRubyBros
  include Ruby2D::DSL

  def coin_reset(level)
    level.coins.each do |coin|
      coin.y -= 1000 if coin.y > 1000
    end
  end

  def platform_collision
    if @stage_one == true
      @level_one.platforms.each do |platform|
        if platform.contains?(@player.square.x3,
                              @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
          @player.landed_on_platform
        elsif platform.contains?(@player.square.x1,
                                 @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
          @player.jumper_state = nil
        end
      end
    elsif @stage_two == true
      @level_two.platforms.each do |platform|
        if platform.contains?(@player.square.x3,
                              @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
          @player.landed_on_platform
        elsif platform.contains?(@player.square.x1,
                                 @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
          @player.jumper_state = nil
        end
      end
    elsif @stage_three == true
      @level_three.platforms.each do |platform|
        if platform.contains?(@player.square.x3,
                              @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
          @player.landed_on_platform
        elsif platform.contains?(@player.square.x1,
                                 @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
          @player.jumper_state = nil
        end
      end
    end
  end

  def coin_collision
    if @stage_one == true
      @level_one.coins.each do |coin|
        next unless coin.contains?(@player.square.x1,
                                   @player.square.y1) || coin.contains?(@player.square.x2,
                                                                        @player.square.y2) || coin.contains?(@player.square.x3,
                                                                                                             @player.square.y3) || coin.contains?(
                                                                                                               @player.square.x4, @player.square.y4
                                                                                                             )

        @player.coins += 1
        @sounds.coin
        coin.y += 1000
      end
    elsif @stage_two == true
      @level_two.coins.each do |coin|
        next unless coin.contains?(@player.square.x1,
                                   @player.square.y1) || coin.contains?(@player.square.x2,
                                                                        @player.square.y2) || coin.contains?(@player.square.x3,
                                                                                                             @player.square.y3) || coin.contains?(
                                                                                                               @player.square.x4, @player.square.y4
                                                                                                             )

        @player.coins += 1
        @sounds.coin
        coin.y += 1000
      end
    elsif @stage_three == true
      @level_three.coins.each do |coin|
        next unless coin.contains?(@player.square.x1,
                                   @player.square.y1) || coin.contains?(@player.square.x2,
                                                                        @player.square.y2) || coin.contains?(@player.square.x3,
                                                                                                             @player.square.y3) || coin.contains?(
                                                                                                               @player.square.x4, @player.square.y4
                                                                                                             )

        @player.coins += 1
        @sounds.coin
        coin.y += 1000
      end
    end
  end

  def enemy_collison
    if @stage_one == true
      @level_one.enemies.each do |enemy|
        next unless enemy.contains?(@player.square.x1,
                                    @player.square.y1) || enemy.contains?(@player.square.x2,
                                                                          @player.square.y2) || enemy.contains?(@player.square.x3,
                                                                                                                @player.square.y3) || enemy.contains?(
                                                                                                                  @player.square.x4, @player.square.y4
                                                                                                                )

        @player.lose_life
        @sounds.death
      end
    elsif @stage_three == true
      @level_three.enemies.each do |enemy|
        next unless enemy.contains?(@player.square.x1,
                                    @player.square.y1) || enemy.contains?(@player.square.x2,
                                                                          @player.square.y2) || enemy.contains?(@player.square.x3,
                                                                                                                @player.square.y3) || enemy.contains?(
                                                                                                                  @player.square.x4, @player.square.y4
                                                                                                                )

        @player.lose_life
        @sounds.death
      end
    end
  end

  def has_won?
    if @stage_one == true
      if @level_one.goal.contains?(@player.square.x1,
                                   @player.square.y1) || @level_one.goal.contains?(@player.square.x2,
                                                                                   @player.square.y2) || @level_one.goal.contains?(@player.square.x3,
                                                                                                                                   @player.square.y3) || @level_one.goal.contains?(
                                                                                                                                     @player.square.x4, @player.square.y4
                                                                                                                                   )
        @stage_one = false
        @stage_two = true
        @sounds.next_level
        @player.reset = true
      end
    elsif @stage_two == true
      if @level_two.goal.contains?(@player.square.x1,
                                   @player.square.y1) || @level_two.goal.contains?(@player.square.x2,
                                                                                   @player.square.y2) || @level_two.goal.contains?(@player.square.x3,
                                                                                                                                   @player.square.y3) || @level_two.goal.contains?(
                                                                                                                                     @player.square.x4, @player.square.y4
                                                                                                                                   )
        @stage_two = false
        @stage_three = true
        @sounds.next_level
        @player.reset = true
      end
    elsif @player.lives > 0 && @stage_three == true && @level_three.goal.contains?(@player.square.x1,
                                                                                   @player.square.y1) || @level_three.goal.contains?(@player.square.x2,
                                                                                                                                     @player.square.y2) || @level_three.goal.contains?(@player.square.x3,
                                                                                                                                                                                       @player.square.y3) || @level_three.goal.contains?(
                                                                                                                                                                                         @player.square.x4, @player.square.y4
                                                                                                                                                                                       )
      @stage_three = false
      @winning_screen = true
    end
  end

  def player_methods
    @player.jump
    @player.checks_if_falling
    @player.fall_death
    @player.reset
    @player.hard_reset
  end

  def level_methods(level)
    level.add_assets
    level.enemy_movement
  end

  GRAVITY = 7

  def run
    set title: 'Super Ruby Bros', background: 'red', width: 900, height: 700

    @level_one = LevelOne.new
    @level_two = LevelTwo.new
    @level_three = LevelThree.new
    @player = Player.new
    @win_screen = WinScreen.new
    @sounds = Sounds.new
    @game_over_sound = false
    @stage_one = true
    @stage_two = false
    @stage_three = false
    @winning_screen = false

    on :key_held do |event|
      if event.key == 'a' && @player.x > 0
        @player.x -= 4
        @player.hero.play(flip: :horizontal)
      elsif event.key == 'd' && @player.x < 868
        @player.x += 4
        @player.hero.play
      elsif event.key == 'space' && @player.jumper_state == 'grounded'
        @player.jumper_state = :jumping
      elsif event.key == 'return'
        @player.hard_reset = true
        @stage_one = true
        @stage_two = false
        @stage_three = false
        coin_reset(@level_one)
        coin_reset(@level_two)
        coin_reset(@level_three)
        @game_over_sound = false
      end
    end

    on :key_up do |event|
      @player.jumper_state = nil if event.key == 'space'
    end

    update do
      clear
      # TODO: test by asserting all the sprites positions
      @player.draw
      # TODO: how do we test?
      platform_collision
      coin_collision
      enemy_collison
      # TODO: test by asserting background
      background = Image.new('./assets/bg.png', z: 3)
      # TODO: test by asserting x and y on hero sprite
      @player.hero.x = @player.x
      @player.hero.y = @player.y
      @player.hero.add
      # TODO: how do we test?
      has_won?
      # TODO: test by asserting x and y on hero sprite
      @player.gravity
      # TODO: how do we test?
      player_methods
      if @player.lives > 0 && @stage_one == true
        # TODO: test by asserting things on the screen
        level_methods(@level_one)
        # TODO: test by asserting things on the screen
        @level_one.check_enemy_0_boundary
        # TODO: how do we test?
        @level_one.portal.play(flip: :horizontal)
        # TODO: how do we test?
        @level_one.coin_animation
      elsif @player.lives > 0 && @stage_two == true
        level_methods(@level_two)
        @level_two.portal.play(flip: :horizontal)
        @level_two.coin_animation
      elsif @player.lives > 0 && @stage_three == true
        level_methods(@level_three)
        @level_three.portal.play
        @level_three.coin_animation
        @level_three.check_enemy_0_boundary
        @level_three.check_enemy_1_boundary
        @level_three.check_enemy_2_boundary
      elsif @player.lives > 0 && @winning_screen == true
        @win_screen.add_assets
        Text.new(@player.coins, z: 4, color: 'red', size: 40, x: 438, y: 540)
        @player.y -= 7
        @win_screen.coin_animation
      else
        if @game_over_sound == false
          @sounds.game_over
          @game_over_sound = true
        end
        background = Image.new('./assets/bg.png', z: 8)
        background = Image.new('./assets/gameover.png', z: 9, x: 150, y: 200)
        endgame_text = Text.new('Coins Collected', z: 9, color: 'red', size: 25, x: 360, y: 500)
        total_coins = Text.new(@player.coins, z: 9, color: 'red', size: 40, x: 438, y: 540)
        endgame_text = Text.new('Hit Enter to try again...', z: 9, color: 'red', size: 20, x: 350, y: 600)
      end
    end

    show
  end
end
