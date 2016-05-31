class BaseController < ApplicationController

  def create
    save_or_render(action: 'new')
  end

  def update
    save_or_render(action: 'edit')
  end

  def destroy
    resource.destroy if resource.present?
    redirect_to collection_name.to_sym
  end

  protected

  def save_or_render(action:)
    if resource.save
      flash[:success] = "The #{resource_name} was saved!"
      redirect_to(resource)
    else
      flash[:alert] = "The #{resource_name} was not saved!"
      render action.to_sym
    end
  end

  def resource_class
    controller_name.classify.constantize
  end

  def end_of_association_chain
    resource_class
  end

  def collection_name
    controller_name
  end

  def resource_name
    controller_name.singularize
  end

  def resource
    send(resource_name)
  end
end
