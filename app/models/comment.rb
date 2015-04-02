class Comment < ActiveRecord::Base

    belongs_to :link
    belongs_to :user
    validates :body, presence: true

end