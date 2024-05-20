
require 'gosu'
require_relative 'shootball'
require_relative 'log'

class PlayerShip

	def initialize(window)
		@window = window
		
		@x = window.width/2
		@y = window.height/2	
		@width = 30
		@height = 0.866*@width
		
		@balls = Array.new(30) { ShootBall.new(window) }
		@ball_n = 0
		
		@start_shoot = false
		@last_shoot_time = Gosu.milliseconds
		@shoot_interval = 100
	end

	def draw
		draw_ship(@x,@y,@width,@height)
		@balls.each(&:draw)
	end

	def update	
		move_ship(@window.mouse_x,@window.mouse_y)

		current_time = Gosu.milliseconds
		elapsed_time = (current_time - @last_shoot_time)

		
		if @start_shoot && elapsed_time > @shoot_interval
			shoot
			@last_shoot_time = current_time
		end

		@balls.each(&:update)
	end

	##########################################

	
	def draw_ship(x,y,w,h)
	    @window.draw_triangle(
      		x, y, Gosu::Color::GREEN,
      		x-w/2, y+h, Gosu::Color::GREEN,
      		x+w/2, y+h, Gosu::Color::GREEN
    	)

	end


	def move_ship(x,y)		
		@x,@y=x,y
		@x=@width/2					unless @x>0
		@x=@window.width-@width/2	unless @x<@window.width
		@y=0						unless @y>0
		@y=@window.height-@height 	unless @y<@window.height
	end

	def shoot
		@balls[@ball_n].shoot(@x,@y)
		@ball_n+=1
		@ball_n%=@balls.size
	end

	def button_down(id)
		case id
		when Gosu::MS_LEFT
			log("start shoot")
			@start_shoot = true
		when Gosu::MS_RIGHT
			#change weapon
		end
	end

	def button_up(id)
		case id
		when Gosu::MS_LEFT
			log("End SHOOT")
			@start_shoot = false
		end
	end
end


















#### playerShip.rb

