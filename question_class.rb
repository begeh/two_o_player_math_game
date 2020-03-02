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