class Player
    require 'pry'
    #we only have attr_reader here b/c we only want to read the token NOT to change/write it
    #once the player choose a token "X" or "O", the token cannot change!
    attr_reader :token
    def initialize(token)
        #when we initialize a player, the player also has a token ("X" or "O") associate with it
        # binding.pry
        @token = token
    end 

end 