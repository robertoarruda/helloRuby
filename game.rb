class Game

  def initialize()
    @attemps = 0
    setPcNumber()
  end

  def setPcNumber()
    @pcNumber = Random.rand(99) + 1
  end

  def play()
    @attemps += 1
    if @attemps == 1
      puts ""
      puts "PC: Adivinhe o numero que estou pensando entre 1 e 100:"
    end

    getPlayerNumber()
    verify()
  end

  def getPlayerNumber()
    @playerNumber = gets.to_i
    puts ""
  end

  def verify()
    if @playerNumber == @pcNumber
      puts "PC: Voce acertou #{@pcNumber} (tentativas #{@attemps})!!!"
      restart()
    end

    error = "menor"
    if @playerNumber > @pcNumber
      error = "maior"
    end 

    puts "PC: #{@playerNumber} e' #{error} que o numero que eu pensei, tente novamente!"
    play()
  end

  def restart()
    puts "PC: Deseja jogar novamente? (s/n)"
    if (gets.chomp == "s")
      setPcNumber()
      @attemps = 0
      play()
    end

    puts "PC: Obrigado por jogar!"
    exit
  end

end

game = Game.new
game.play()