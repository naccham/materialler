class CreateSiteTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :site_tag_relations do |t|

      t.timestamps
    end
  end
end
