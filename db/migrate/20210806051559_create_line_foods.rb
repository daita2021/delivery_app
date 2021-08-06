class CreateLineFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :line_foods do |t|
      t.references :food, null: false, foreign_key: true #t.references :food でfoodsテーブルの主キー(id)を参照し、foreign_key: trueで外部キー制約をかけて参照先のキー(id)にあるデータ以外をこのカラム(food_idというキー名に勝手になる)に追加できないようにする。つまりfood_idカラムに入れる値は、foodsテーブルのidカラムにある値から選んで入れなさい』な制約
      t.references :restaurant, null: false, foreign_key: true
      t.references :order, foreign_key: true #null: falseを指定してないのはorderが確定するまではline_foodsレコードはorderのことを知らず、初期値にnullを許可するため
      t.integer :count, null: false, default: 0
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
