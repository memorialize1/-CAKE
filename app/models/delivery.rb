class Delivery < ApplicationRecord
  belongs_to :user

# バリデーション
  validates :postal_code,        presence: true
  validates :address,         presence: true
  validates :name,        presence: true

  def full_address
    postal_code + " " + address + " " + name
  end
end
