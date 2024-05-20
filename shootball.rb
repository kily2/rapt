
require 'gosu'
require_relative 'playerShip'
require_relative 'log'

class ShootBall
	
	def initialize(window)
		@window = window
		@x,@y = 0,0
		@radius = 2

		@start=false
	end


	def draw
		if @start && @y > -5
			@y-=2	
		elsif @start
			@start=false
			log("#{@y} : y, #{@start} : start")
		end
		draw_circle(@x,@y,@radius,Gosu::Color::WHITE)
	end


	def update

	end

	def draw_circle(x, y, radius, color)
		segments = 32
		angle_step = 2 * Math::PI / segments

		segments.times do |i|
	  		angle1 = angle_step * i
	  		angle2 = angle_step * (i + 1)

	 		x1 = x + radius * Math.cos(angle1)
	  		y1 = y + radius * Math.sin(angle1)
	  		x2 = x + radius * Math.cos(angle2)
	  		y2 = y + radius * Math.sin(angle2)

	  		@window.draw_triangle(x, y, color, x1, y1, color, x2, y2, color)
		end
	end

	def shoot(x,y)
		@x,@y=x,y
		@start=true
	end	
end

















#### shootball.rb

