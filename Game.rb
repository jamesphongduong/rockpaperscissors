require_relative 'Player'
require 'rainbow'

class Game
    def initialize
        system "clear"
        puts Rainbow(File.read("welcomebanner.txt")).blink
        animation("A place where you vs a CPU in Rock, Paper, Scissors for money!")
        animation("\n\nPlease input player name: ")
        input = gets.capitalize.chomp
        addPlayer(input)
        playGame
    end
    def addPlayer(player_name)
        @player = Player.new(player_name)
    end

    def win
        puts Rainbow(File.read("win.txt")).blink
        @player.cash += @bet_amount
    end

    def loss
        puts Rainbow(File.read("lost.txt")).red
        @player.cash -= @bet_amount
        if @player.cash == 0 
        puts "You have $0, time to go home mate."
        abort
        end
    end

    def tie
        puts Rainbow(File.read("tie.txt")).yellow
    end

    #print out text slowly
    def animation(text)
        text.each_char  { |text| print text ; sleep(0.05) }
    end

    def setBet
        puts "\nHow much would you like to bet?"
        while true do
            @bet_amount = gets.chomp.to_i
            if @bet_amount == 0 
                puts "Pleasy try again."
            elsif @bet_amount > @player.cash 
                puts "Insufficient funds, please try again."
            elsif @bet_amount <= @player.cash
                system "clear"
            break
            end
        end
    end

    def playGame
        setBet
        options = ["scissors", "papers", "rock"]
        hash = {s: "scissors", p: "papers", r: "rock"}   
        while true
            puts "Please select one: Rock, Paper, Scissors (R/P/S)"
            player_choice = gets.chomp
            if player_choice == "s" || player_choice == "p" || player_choice == "r" 
            break
            else
            puts "Invalid choice, please try again."
            end
        end
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
        puts "Total cash: $#{@player.cash}"
        while true do 
        puts "Wanna play again? (Y/N)"
        input = gets.downcase.chomp
        system "clear"
        if input == "y"
            playGame
        elsif input == "n"
            puts "Thanks for playing #{@player.name}. Your total cash is $#{@player.cash}"
            break   
        else puts "Incorrect input, please try again."
        end
        end
    end
end

Game.new