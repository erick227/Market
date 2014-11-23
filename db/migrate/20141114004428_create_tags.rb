class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :media_tags, id: false do |t|
      t.integer :tag_id
      t.integer :medium_id
    end

    add_index :media_tags, [:tag_id, :medium_id]
  end
end
