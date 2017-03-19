class WorkTimeTableController < ApplicationController
  unloadable

  DATE_FMT = '%Y-%m-%d'
  def index
    @user = User.current
    @month = Time.parse(params[:month] || Time.now.strftime(DATE_FMT))
  end

  def next
  end

  def prev
  end
end
