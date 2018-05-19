##
# Helpers for images views
module ImagesHelper
  def resource_name(owner)
    owner.class.name.pluralize.humanize.downcase
  end
end
