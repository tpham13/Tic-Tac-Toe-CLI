class Board
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


end  