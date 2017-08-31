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
	end

	def initialize(board : Array(Array(Int32|Nil)))
		@board = [] of Array(Int32|Nil)
		@board.each { |line| @board.push(line) }
		self
	end

	def display
		@board.each do |row|
			puts row.map { |z| z ? z.to_s : " " }.join("|")
		end
	end

	def add(row : Int32, col : Int32, piece)
		@board[row][col] = piece
	end

	def check(piece)
		max = 0
		check = (@board[0][0] == piece ? 1 : 0) + (@board[1][1] == piece ? 1 : 0) + 
			(@board[2][2] == piece ? 1 : 0)
		if check > max
			max = check
		end
		check = (@board[2][0] == piece ? 1 : 0) + (@board[1][1] == piece ? 1 : 0) + 
			(@board[0][2] == piece ? 1 : 0)
		if check > max
			max = check
		end
		3.times do |x|
			row = 0
			col = 0
			3.times do |y|
				if @board[x][y] == piece
					row += 1
				end
				if @board[y][x] == piece
					col += 1
				end
			end
			if row > max
				max = row
			end
			if col > max
				max = col
			end
		end
		return max
	end
end

class Game

end
end

include Tic 

# x % 3 ; (x - (x % 3)) / 3
board = Board.new
board.add(2,2,0)
board.add(1,1,0)
board.display
puts board.check(0)
