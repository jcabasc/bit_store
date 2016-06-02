class WeeklyReportsController < ApplicationController

  def create
    WeeklyReportMailer.send_report.deliver
    head :ok
  end

end
