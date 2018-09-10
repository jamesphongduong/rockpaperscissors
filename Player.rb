class Player
    attr_accessor :cash
    def initialize(name)
        @name = name
        @cash = 100
        puts @cash 
    end
    def bet(bet_amount)
        @bet_amount = bet_amount
    end
    def win
        @cash += @bet_amount
    end
    def lose
        @cash -= @bet_amount
    end
end

# x = gets.chomp

# hash = {s: "scissors", p: "papers", r: "rock"}

# puts hash[:x]
# puts "test"
# puts hash[:s]