class WeeklyReportMailer < ApplicationMailer
  def send_report
    @summary = PurchaseReport.build
    mail to: "user@test.com", subject: "Reporte Semanal!"
  end
end
