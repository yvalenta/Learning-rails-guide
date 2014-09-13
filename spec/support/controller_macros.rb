module ControllerMacros
  def attributer_with_foreign_keys(*args)
    FactoryGirl.build(*args).attributes.delete_if do |key, val|
      %w{id type created_at updated_at}.member?(key)
    end
  end
end