class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :tag_id
      t.string :title
      t.text :introduce
      t.timestamps
    end
  end
end
