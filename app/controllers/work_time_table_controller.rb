class WorkTimeTableController < ApplicationController
  unloadable


  def index
    @user = User.current
    @month = Time.parse(params[:month] || Time.now.strftime('%Y-%m-%d'))
    puts @month
    puts @user
  end

  def next
  end

  def prev
  end
end
