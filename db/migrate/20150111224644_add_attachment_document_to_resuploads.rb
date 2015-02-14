class AddAttachmentDocumentToResuploads < ActiveRecord::Migration
  def self.up
    change_table :resuploads do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :resuploads, :document
  end
end
