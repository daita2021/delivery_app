class Restaurant < ApplicationRecord # Restaurantモデル定義 単数系注意
  has_many :foods #店舗情報は複数の商品情報を持つ
  has_many :line_foods, through: :foods #店舗情報は商品情報を通して複数の仮注文情報を持つ

  validates :name, :fee, :time_required, presence: true # 指定した複数のキーのカラムにデータが存在しなければエラーにする
  validates :name, length: { maximum: 30 }
  validates :fee, numericality: { greater_than: 0 } # 0以上の数値のみ
end
