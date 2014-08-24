require 'rubygems'
require 'shen_ruby'

shen = ShenRuby::Shen.new

class << shen
	#add a function to std shen library which returns true if b divides evenly into a
	def divides?(a,b)
		b % a == 0
	end
end