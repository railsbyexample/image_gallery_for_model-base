##
# Helpers for properties views
module PropertiesHelper
  def cover_url(property)
    if property.images.count.zero?
      'https://placehold.it/400x300'
    else
      attachment_url(property.images.first, :attached_file)
    end
  end

  def size(property)
    "#{property.size_in_square_feet.to_i} sq. ft."
  end

  def price(property)
    "#{money_without_cents_and_with_symbol(property.price_per_month)}/mo"
  end
end
