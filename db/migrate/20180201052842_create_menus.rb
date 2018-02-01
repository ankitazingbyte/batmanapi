class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :starter
      t.float :price
      t.string :salad
      t.string :soup
      t.string :pizza
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
