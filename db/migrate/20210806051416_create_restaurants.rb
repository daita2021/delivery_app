class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t| # restaurants テーブルの作成
      t.string :name, null: false #string型 name(店舗名)カラム nullにせず
      t.integer :fee, null: false, default: 0 #integer型 fee(配送料)カラム nullにせず default値0
      t.integer :time_required, null: false #配送時間カラム

      t.timestamps # created_at、updated_atカラム
    end
  end
end
