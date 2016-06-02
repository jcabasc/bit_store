module EventRecorder
  extend ActiveSupport::Concern

  included do
    after_save { |resource| resource.call("save") }
    after_find { |resource| resource.call("select") }
    after_destroy { |resource| resource.call("destroy") }
  end

  def call(action)
    Log.create(fecha: Time.now, descripcion: build_description(action))
  end

  private

  def build_description(action)
    "action: "+ action + ", resource: "+ resource_type + build_resource_id
  end

  def build_resource_id
    self.persisted? ? ", id: " + self.id.to_s : ""
  end

  def resource_type
    self.class.name.downcase
  end
end
