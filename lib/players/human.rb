module Players 
    class Human < Player
        def move(board)
            puts "Please enter your selection between 1 and 9"
            #strip method strip the extra space in user input off
            gets.strip
        end 
    end 
end 