
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
		
		@ball = ShootBall.new(window)
	end

	def draw
		draw_ship(@x,@y,@width,@height)
	end

	def update
		move(@window.mouse_x,@window.mouse_y)
	end

	##########################################

	
	def draw_ship(x,y,w,h)
	    @window.draw_triangle(
      		x, y, Gosu::Color::GREEN,
      		x-w/2, y+h, Gosu::Color::GREEN,
      		x+w/2, y+h, Gosu::Color::GREEN
    	)

		@ball.draw
	end


	def move(x,y)		
		@x,@y=x,y
		@x=@width/2					unless @x>0
		@x=@window.width-@width/2	unless @x<@window.width
		@y=0						unless @y>0
		@y=@window.height-@height 	unless @y<@window.height
	end

	def shoot
		@ball.shoot(@x,@y)
	end

	def button_down(id)
		case id
		when Gosu::MS_LEFT
			log("Shoot")
			shoot
		when Gosu::MS_RIGHT
			#change weapon
		end
	end
end


















#### playerShip.rb

