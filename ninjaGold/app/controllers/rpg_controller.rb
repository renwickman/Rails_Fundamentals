class RpgController < ApplicationController
  def the_time
    time = DateTime.now
    this_moment = "(" + time.strftime("%b %d, %Y %I:%M %P") + ")"
    return this_moment
  end

  def index
    if !session[:gold]
      session[:gold] = 0
    end
    if !session[:log]
      message = 'Joined Ninja Gold on ' + the_time
      session[:log] = []
      session[:log] << message
    elsif session[:arena] == 'farm' || session[:arena] == 'cave' || session[:arena] == 'house'
      message = "Just made #{session[:new_gold]} gold in the #{session[:arena]} " + the_time
      session[:log] << message
    elsif session[:arena] == 'casino' && session[:new_gold] >= 0
      message = "Well, I went to the casino . . . and made #{session[:new_gold]} gold " + the_time
      session[:log] << message
    elsif session[:arena] == 'casino' && session[:new_gold] < 0
      message = "I went to the casino . . . and lost #{session[:new_gold]} gold . . . Ouch. " + the_time
      session[:log] << message
    end
    @activities = session[:log]
    @gold = session[:gold]
  end

  def farm
    session[:new_gold] = rand(10..20)
    session[:arena] = 'farm'
    session[:gold] += session[:new_gold]
    @gold = session[:gold]
    redirect_to :action => :index
  end

  def cave
    session[:new_gold] = rand(5..10)
    session[:arena] = 'cave'
    session[:gold] += session[:new_gold]
    @gold = session[:gold]
    redirect_to :action => :index
  end

  def house
    session[:new_gold] = rand(2..5)
    session[:arena] = 'house'
    session[:gold] += session[:new_gold]
    @gold = session[:gold]
    redirect_to :action => :index
  end

  def casino
    chance = rand(0..100)
    if chance < 20
      session[:new_gold] = rand(0..50)
      session[:arena] = 'casino'
      session[:gold] += session[:new_gold]
      @gold = session[:gold]
    else
      session[:new_gold] = rand(-50..0)
      session[:arena] = 'casino'
      session[:gold] += session[:new_gold]
      @gold = session[:gold]
    end
    redirect_to :action => :index
  end

  def destroy
    session.clear
    redirect_to :root
  end

end
