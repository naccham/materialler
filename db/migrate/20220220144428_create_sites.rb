class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :tag_id
      t.integer :bookmark_id
      t.string :title
      t.text :introduce
      t.string :url
      t.boolean :commercial_use, default: false,  null: false
      t.boolean :credit_notation, default: false,  null: false
      t.timestamps
    end
  end
end
