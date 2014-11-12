class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string   :title
      t.string   :author
      t.string   :kind
      t.string   :secondary_info
      t.belongs_to :user
      t.datetime :year_created
      
      t.timestamps
    #testing shite
    end
  end
end
