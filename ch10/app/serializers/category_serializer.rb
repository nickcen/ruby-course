class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :logo

  has_many :products  do
    object.products.where(is_del: false)
  end

  def logo
    "http://olavg5ba4.bkt.clouddn.com/#{object.logo}"
  end
end
