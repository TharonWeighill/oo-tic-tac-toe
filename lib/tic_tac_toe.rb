
class TicTacToe
    def initialize
        @board = Array.new(9, " ")
    end 

    WIN_COMBINATIONS = [
        [0,1,2],
        [0,3,6],
        [0,4,8],
        [1,4,7],
        [2,5,8],
        [3,4,5],
        [6,7,8],
        [2,4,6] ]
        def display_board 
            puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
            puts "-----------"
            puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
            puts "-----------"
            puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        end 
        def input_to_index (string)
            string.to_i - 1
        end
        def move(index, token)
            @board[index] = token
        end
        def position_taken?(index)
            if @board[index] == " "
                false
            else 
                true
            end
        end
        def valid_move?(index)
            !position_taken?(index) && index.between?(0, 8)
        end 
        def turn_count
            @board.count {|square| square != " " }
        end 
        def current_player 
            if turn_count % 2 == 0
            "X"
            else
            "O"
            end
        end 
        def turn
            user_input = gets
            index = input_to_index(user_input) 
            if valid_move?(index)
               token = current_player
               move(index, token)
            else
                turn
            end
            display_board
        end
        def won?
            WIN_COMBINATIONS.any? do |sequence|
              if position_taken?(sequence[0]) && @board[sequence[0]] == @board[sequence[1]] && @board[sequence[1]] == @board[sequence[2]] 
               return sequence
              end
            end
        end
        def full?
            @board.all? {|index| index != " " }
        end 
        def draw?
            full? && !won?
        end
        def over?
            draw? || won?
        end 
        def winner
            if sequence = won?
                @board[sequence[0]]
            end               
        end
        def play
            turn until over?
            if winner
                puts "Congratulations #{winner}!"
            else
                puts  "Cat's Game!"
            end 
        end
    end

