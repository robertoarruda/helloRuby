class Game

  def initialize
    clear
  end

  def clear
    @attemps = 0
    setPcNumber
  end

  def setPcNumber
    @pcNumber = Random.rand(99) + 1
  end

  def play
    @attemps += 1

    if @attemps == 1
      puts "\nPC: Adivinhe o numero que estou pensando entre 1 e 100:"
    end

    getPlayerNumber
    verify
  end

  def getPlayerNumber
    @playerNumber = gets.to_i
    puts ""
  end

  def verify
    if @playerNumber == @pcNumber
      puts "PC: Voce acertou #{@pcNumber} (tentativas #{@attemps})!!!"
      restart
    end

    error
  end

  def restart
    puts "PC: Deseja jogar novamente? (s/n)"

    response = gets.chomp

    if !['n', 's'].include? response
      restart
    end

    if response == "n"
      puts "\nPC: Obrigado por jogar!\n\n"
      exit
    end

    clear
    play
  end

  def error
    error = "menor"

    if @playerNumber > @pcNumber
      error = "maior"
    end 

    puts "PC: #{@playerNumber} e' #{error} que o numero que eu pensei, tente novamente!"
    play
  end

end

game = Game.new
game.play