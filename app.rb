require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name].reverse
    "#{@name}"
  end

  get '/square/:number' do
    @square = params[:number].to_i ** 2
    "#{@square.to_s}"
  end

  get '/say/:number/:phrase' do
    number = params[:number].to_i
    phrase = params[:phrase]
    repeated_phrase = ''
    
    number.times do 
      repeated_phrase += phrase
    end
    repeated_phrase
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    counter = 0
    @phrase = ''
    4.times do
      counter += 1
      @word = "word" + counter.to_s
      @phrase += params[@word] + " "
    end
    @phrase += params[:word5] + "."
    @phrase
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i

    case @operation
    when "add"
      @answer = @num1 + @num2
    when "subtract"
      @answer = @num1 - @num2
    when "multiply"
      @answer = @num1 * @num2
    when "divide"
      @answer = @num1 / @num2
    end

    @answer.to_s
  end



end