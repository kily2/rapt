
require 'gosu'
require_relative 'log'

class EnemyShip
	def initialize(window)
		@window=window

		@x,@y=100,100
		@width = 50
		@height = 30

		@life = 100
	end

	def draw
		draw_ship(@x,@y,@width,@height) if @life > 0
	end

	def draw_ship(x,y,w,h)
		@window.draw_quad(	x, 		y, 	 Gosu::Color::BLUE,
        					x+w, 	y, 	 Gosu::Color::BLUE,
        					x+w, 	y+h, Gosu::Color::RED,
    						x,		y+h, Gosu::Color::RED)	
	end

	def update
				
	end

	def hit(x,y)
		if x>=@x&&x<@x+@width&&y<@y+@height&&@life>0
			@life -= 5
			log("life: #{@life}")
			return true
		end
		false
	end

end
















#### enemy1.rb

