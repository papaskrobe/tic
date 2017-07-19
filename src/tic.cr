require "./tic/*"

module Tic
class Board
	def initialize()
		@board = [] of Array(Int32|Nil)
		3.times do
			row = Array(Int32|Nil).new
			3.times { row.push(nil) }
			@board.push(row)
	end

	def initialize(board : Array(Array(Int32|Nil)))
		@board = [] of Array(Int32|Nil)
		@board.each { |line| @board.push(line) }
		self
	end
end
end

