class Board
    require 'pry'
    # def cells
    #     @cells 
    # end 

    # def cells=(cell)
    #     @cells = cell
    # end 
     # instead of writing the reader and writer method for cells, we can use attr_accessor
    attr_accessor :cells
    def initialize
        reset!
    end
    def reset!
        #when creating an array, we can pass in a couple arguments: num of element, what we want and in this case a blank space
        @cells = Array.new(9, " ")
    end 
    
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end 

    def position(input)
        #whatever we get from user is going to be a string, "1" or "2" and Ruby doesn't know, so we need
        #to turn it into an integer & we need to subtract one b/c the index/position of the cell is starting at 0
        cells[input.to_i-1]
    end

    #a question mark indicate that this method is either return true/false
    def full?
        #check to see if each cell is full 
        #if full return true, not full return be_false
        #we're going to loop through each cell on the board using method all and check if there's an X or an O
        cells.all?{|character| character == "X" || character == "O"}
        #this code is the same as above: 
        # cells.all? do |character| 
        #     # binding.pry
        #     if character == "X" || character == "O"
        #         true
        #     else
        #         false 
        #     end 
        # end 
    end 

    def turn_count
        #here we check each cell and see which one has "X" which one has "O"
        cells.count{|char| char == "X" || char == "O"}
        # binding.pry
    end

    def taken?(input)
        #check if the position of each cell is an empty string ""
        # binding.pry
        position(input)=="X" || position(input)=="O"
        #the code below also work: it check for if there's a space of empty string
        # !(position(input)==" " || position(input)=="")
    end 

    def valid_move?(input)
        #make sure user's input turn from string to integer & 
        #check if user input is between 1-9
        #check if cell is not taken 
        # binding.pry
        input.to_i.between?(1,9) && !taken?(input)
    end 

    def update(input, player)
        #update method is going to put the player token(x or o) in the position that it need to be in
        #token is given by the spec the test give us
        cells[input.to_i-1] = player.token #stands for either X or O 
    end 

end  