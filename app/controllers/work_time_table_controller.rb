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
    TimeEntryActivity.all().each do |activity|
      @time_log[activity.to_s] = {}
      @activities << activity.to_s
      time_log_activity = @time_log[activity.to_s]
      TimeEntry.where("activity_id = :id AND user_id = :user AND spent_on >= :from AND spent_on <= :to", {:id => activity.id, :user => User.current, :from => from_date, :to => end_date }).each do |obj|
        k = obj.spent_on.to_s
        if time_log_activity.has_key?(k)
          time_log_activity[k] += obj.hours
        else
          time_log_activity[k] = obj.hours
        end
      end
    end
  end

  def next
  end

  def prev
  end
end
