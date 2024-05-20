
require 'gosu'
require_relative 'playerShip'
require_relative 'log'

class ShootBall
attr_reader :x,:y
attr_accessor :hit

	def initialize(window)
		@window = window
		@x,@y = 0,0
		@radius = 2

		@start=false
		@last_update_time = Gosu.milliseconds
    	@speed = 250

		@hit = false
	end



	def draw
		draw_circle(@x,@y,@radius,Gosu::Color::WHITE) if @start && !@hit
	end



	def update
	   	current_time = Gosu.milliseconds
    	elapsed_time = current_time - @last_update_time	

		if @start && @y > -@radius
			@y -= @speed * elapsed_time / 1000.0	
		elsif @start
			@start=false
			log("#{@y} : y, #{@start} : start")
		end

		@last_update_time = current_time
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
		@hit=false
		@last_update_time = Gosu.milliseconds
	end	
end

















#### shootball.rb

