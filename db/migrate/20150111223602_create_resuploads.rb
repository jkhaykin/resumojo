class CreateResuploads < ActiveRecord::Migration
  def change
    create_table :resuploads do |t|

      t.timestamps
    end
  end
end
