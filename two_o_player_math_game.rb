
# class Game has local variables player1_lives and player2_lives, both are equal to 3 when initializing Game
# local variable current_player is equal to "Player 1" or player2 based on the current player
# When run a game loop, and after each turn we check if answer was right or wrong and then based on what current_player is, player1_slives and player2_lives will be updated
# at the end of each loop run, we will check if either player1_score or player2_score is equal to 0. If so print, gameover line. If not, print current score line and then check current_player to apply score change
# finally switch player to other player (i.e. if player1 is current_player, change to player2)

class Player
  attr_accessor :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end
end

class Question
  def initialize(name)
    @name= name
    @num1= rand(1..20)
    @num2 = rand(1..20)
    @change_in_score = 0
  end
  def check_answer
    puts "#{@name}: What does #{@num1} plus #{@num2} equal?"
    answer = gets.chomp
    if answer.to_i == (@num1 + @num2)
      puts "YES! you are correct."
      @change_in_score = 0
    else
     puts "Seriously? No!"
     @change_in_score = -1
    end
    @change_in_score
  end
end

class Game
  def initialize(current_player)
    @current_player = current_player    
    @player1 = Player.new("P1")
    @player2 = Player.new("P2")
    @check_gameover = false
  end
  def run_game
    while(@check_gameover == false)
      question = Question.new(@current_player)
      @change_in_score = question.check_answer
      if @current_player == @player1.name
        @player1.lives += @change_in_score
        @current_player = "P2"
      else
        @player2.lives += @change_in_score
        @current_player = "P1"
      end
      if (@player1.lives == 0 or @player2.lives == 0) and @current_player == "P1"
        @check_gameover = true
      end
      if @check_gameover == true
        if @player1.lives > @player2.lives
          puts "Player 1 wins with a score of #{@player1.lives}/3"
        elsif @player1.lives < @player2.lives
          puts "Player 2 wins with a score of #{@player2.lives}/3"
        else
          puts "It's a draw." 
        end
        puts "----- GAME OVER -----"
      else
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
        puts "----- NEW TURN -----"
      end
    end
  end
end

game = Game.new("P1")
game.run_game