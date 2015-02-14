class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :comment
      t.integer :xcoord
      t.integer :ycoord
      t.integer :user_id
      t.integer :resupload_id

      t.timestamps
    end
  end
end
