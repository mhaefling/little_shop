class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: {only_float: true}
  validates :merchant_id, presence: true, numericality: {only_integer: true}

  def self.sort_by_price()
      Item.order(:unit_price)
  end

  def self.fetch_merchant(item)
    Merchant.find(item.merchant_id)
  end

end