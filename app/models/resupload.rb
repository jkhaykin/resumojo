class Resupload < ActiveRecord::Base
require 'RMagick'

belongs_to :user
has_many :suggestions

has_attached_file :document, :url => "/docs/:id/:basename.:extension"

validates_attachment_content_type :document, :content_type => /\Aimage\/.*\Z/
end