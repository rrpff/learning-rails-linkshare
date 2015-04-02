require 'uri'

class Link < ActiveRecord::Base

    has_many :comments, dependent: :destroy
    belongs_to :user
    validates :title, :url,
        presence: true

    def validate
        begin
            uri = URI.parse(url)
            rescue URI::InvalidURIError
                errors.add(:url, 'The format of the url is not valid.')
        end
    end

end