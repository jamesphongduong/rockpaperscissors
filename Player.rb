class Player
    attr_accessor :cash, :name
    def initialize(name)
        @name = name
        @cash = 100
        animation("\nGreetings #{@name}!")
        animation("\nHere's a free line of credit :)\nCash amount: $#{@cash}\n")
    end
    def bet(bet_amount)
        @bet_amount = bet_amount
    end

    def animation(text)
        text.each_char  { |text| print text ; sleep(0.05) }
    end

end


