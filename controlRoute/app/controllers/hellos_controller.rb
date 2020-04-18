class HellosController < ApplicationController

  def index
    render text: 'What do you want me to say?'
  end

  def hello
    render text: 'Hello CodingDojo!'
  end

  def say
    unless params[:name]
      render text: 'Saying Hello!'
    else
      if params[:name] == 'michael'
        redirect_to '/say/hello/joe'
      else
        render text: "saying hello #{params[:name]} !"
      end
  end
end

  def times
		session[:counter] ||= 0
		session[:counter] += 1
		render text: "You visited this url #{session[:counter]} time(s)!"
	end


  def restart
    session.clear
    render text: 'Destroyed the session!'
  end

end
