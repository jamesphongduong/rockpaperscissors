require_relative 'Player'

class Game
    def initialize
        puts "Player name:"
        input = gets.chomp
        addPlayer(input)
        setBet
        playGame
    end
    def addPlayer(player_name)
        @player = Player.new(player_name)
        puts "Welcome #{@player}"
    end
    def win
        puts "You won!"
        @player.cash += @bet_amount
    end
    def loss
        puts "You lost!"
        @player.cash -= @bet_amount
    end
    def tie
        puts "Tied!"
    end
    def setBet
        puts "How much would you like to wager?"
        @bet_amount = gets.chomp.to_i
    end
    def playGame
        options = ["scissors", "papers", "rock"]
        hash = {s: "scissors", p: "papers", r: "rock"}
        puts "Choose one: #{options} s/p/r"
        player_choice = gets.chomp.downcase
        cpu_choice = options.sample 
        puts "CPU chose #{cpu_choice} & you chose #{hash[player_choice.to_sym]}"
        if player_choice == "s" && cpu_choice == "scissors"
            tie
        elsif player_choice == "s" && cpu_choice == "papers"
            win
        elsif player_choice == "s" && cpu_choice == "rock"
            loss
        elsif player_choice == "p" && cpu_choice == "scissors"
            loss
        elsif player_choice == "p" && cpu_choice == "papers"
            tie
        elsif player_choice == "p" && cpu_choice == "rock"
            win           
        elsif player_choice == "r" && cpu_choice == "scissors"
            win
        elsif player_choice == "r" && cpu_choice == "papers"
            loss
        elsif player_choice == "r" && cpu_choice == "rock"
            tie  
        end
        puts "Your new cash amount: #{@player.cash}"
    end
end

Game.new