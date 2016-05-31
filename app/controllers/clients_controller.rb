class ClientsController < ApplicationController
  expose(:client, attributes: :client_params, finder_parameter: :id)
  expose(:clients)

  def create
    save_or_render(action: 'new')
  end

  def update
    save_or_render(action: 'edit')
  end

  def destroy
    client.destroy if client.present?
    redirect_to :clients
  end

  private

  def save_or_render(action:)
    if client.save
      flash[:success] = 'The client was saved!'
      redirect_to(client)
    else
      flash[:alert] = 'The client was not saved!'
      render action.to_sym
    end
  end

  def client_params
    params.require(:client).permit(:nombres, :documento, :detalles)
  end
end
