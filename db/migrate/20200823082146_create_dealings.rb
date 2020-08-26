class CreateDealings < ActiveRecord::Migration[6.0]
  def change
    create_table :dealings do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :house_num,     null: false
      t.string     :building
      t.string     :phone,         null: false
      t.references :user,          null: false, foreign_key: true
      t.references :item,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
