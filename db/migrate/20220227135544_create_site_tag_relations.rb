class CreateSiteTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :site_tag_relations do |t|
      t.integer :site_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
