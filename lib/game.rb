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

    def won? 
        #want to check if in each cell(i.e: [0, 1, 2]) has the same character
        WIN_COMBINATIONS.find do |combo|
            #check for the character in the 1st position/index of the cell is = to the 2nd position
            @board.cells[combo[0]] == @board.cells[combo[1]] && 
            #check for the character in the 2nd position/index of the cell is = to the 3rd position
            @board.cells[combo[1]] == @board.cells[combo[2]] && 
            #check for which token("X" or "O") won 
            (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O") 
        end 
    end  

    def draw? 
        @board.full? && !won? 
    end 

    def over?
        #has someone won? or draw?
        #if won is true, it evaluate to true, if draw is true, it will evaluate to true
        won? || draw? 
    end 

    def winner 
        #if a win combination = won? then we want to return 
        #the piece("X" or "O") that won 
        #if winning combo return true
        if winning_combo = won? 
            #then the winner will be whatever token("X" or "O") in that first position/index
            @winner = @board.cells[winning_combo.first]
        end 
    end 

    def turn
        player = current_player
        current_move = player.move(@board)
        #valid_move? from class Board
        if !@board.valid_move?(current_move)
            turn 
        else 
            puts "Turn: #{@board.turn_count+1}\n"
            @board.display 
            @board.update(current_move, player)
            puts "#{player.token} move #{current_move}"
            @board.display
            puts "\n\n"
        end 
    end 

    def play 
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw? 
            puts "Cat's Game!"
        end
    end 
end 