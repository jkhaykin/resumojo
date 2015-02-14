class Suggestion < ActiveRecord::Base
belongs_to :resupload
belongs_to :user
end
