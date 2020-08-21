class CreateSoldOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :sold_outs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
