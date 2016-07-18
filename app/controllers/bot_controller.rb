class BotController < ApplicationController
  
  def hello
  	@time = Time.now
  end

  def goodbye
    @files = Dir.glob('*')
  end

end
