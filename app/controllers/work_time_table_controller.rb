class WorkTimeTableController < ApplicationController
  unloadable

  DATE_FMT = '%Y-%m-%d'
  def index
    @user = User.current
    @month = Time.parse(params[:month] || Time.now.strftime(DATE_FMT))
    from_date = @month.beginning_of_month.to_date
    end_date = @month.end_of_month.to_date
    @activities = []
    @time_log = {}
    (from_date..end_date).each { |e| @time_log[e.strftime(DATE_FMT)] = {}  }
    TimeEntryActivity.all().each do |activity|
      @activities << activity.to_s
      a = activity.to_s
      TimeEntry.where("activity_id = :id AND user_id = :user AND spent_on >= :from AND spent_on <= :to", {:id => activity.id, :user => User.current, :from => from_date, :to => end_date }).each do |obj|
        d = obj.spent_on.strftime(DATE_FMT)
        @time_log[d][a] = (@time_log[d][a] || 0.0) + obj.hours
      end
    end
    respond_to do |format|
      format.html
    end
  end

  def next
  end

  def prev
  end
end
