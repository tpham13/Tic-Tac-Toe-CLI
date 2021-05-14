class Game

    attr_accessor :board, :player_1, :player_2
    #WIN_COMBINATIONS takes in the TTT win combinations as sets of array inside an array
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
      ]
    #this initialize a new game with 2 players and a board
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board 
        @player_1 = player_1
        @player_2 = player_2
    end 

    def current_player
        #turn_count method is from class Board
        @board.turn_count % 2 == 0 ? player_1 : player_2
    end 

    def over?
        #has someone won? or draw?
        #if won is true, it evaluate to true, if draw is true, it will evaluate to true
        won? || draw? 
    end 

    def won? 
        #want to check if in each cell has the same character
        WIN_COMBINATIONS.detect do |winner|
            @board.cells[winner[0]] == @board.cells[winner[1]] && 
            @board.cells[winner[1]] == @board.cells[winner[2]]
            #we want to see if the 2nd cell is equal to the 3 cell 
        end 
    end  

    def draw? 
        @board.full? && !won? 
    end 
end 