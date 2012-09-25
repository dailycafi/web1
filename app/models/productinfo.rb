class Productinfo < ActiveRecord::Base
  attr_accessible :category, :content, :img_url, :product_name, :user_id
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }

  default_scope order: 'productinfos.created_at DESC'
end
