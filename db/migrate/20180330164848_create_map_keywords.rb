class CreateMapKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :map_keywords do |t|
      t.string :name
      t.references :map, foreign_key: true

      t.timestamps
    end
  end
end
