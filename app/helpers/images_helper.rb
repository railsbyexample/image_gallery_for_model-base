##
# Helpers for images views
module ImagesHelper
  def owner_index_path_method(owner)
    "#{owner.class.name.pluralize.underscore}_path".to_sym
  end

  def resource_name(owner)
    owner.class.name.pluralize.humanize.downcase
  end
end
