class ExportsController < ApplicationController
  before_filter :generate_pdf, only: [:create]
  def create
    send_data(@pdf.to_pdf,
              disposition: 'attachment',
              filename: "reporte_cliente_#{client.id}.pdf",
              type: 'application/pdf')
  end


  private

  def generate_pdf
    html = render_to_string(:partial => "clients/details.html.erb", :locals => {:client => client })
    @pdf = PDFKit.new(html)
  end

  def client
    @client ||= Client.includes(:purchases).find(client_finder)
  end

  def client_finder
    params.require(:client_id)
  end
end
