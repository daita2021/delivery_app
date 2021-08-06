class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true

  validates :count, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) } #active: trueになっているものを返すactiveメソッドの定義
  scope :other_restaurant, -> (picked_restaurant_id) { where.not(restaurant_id: picked_restaurant_id) } #restaurant_idが特定の店舗IDではないもの一覧を返すメソッド定義 他の店舗の LineFood があるかどうか？をチェックする際使用

  def total_amount
    food.price * count
  end
end
