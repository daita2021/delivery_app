class Food < ApplicationRecord
  belongs_to :restaurant #restaurantテーブルに所属
  belongs_to :order, optional: true #optional: trueでorder_idがnilでも商品情報をデータベースに登録できるようにする(デフォルトではできない)
  has_one :line_food # 一つの商品情報は一つの仮注文情報を持つ
end
