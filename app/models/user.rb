class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    presence: true,
    length: { in: 1..64 }

  has_many :comments, dependent: :destroy
  has_many :links, dependent: :destroy

  def to_param
    username
  end
end
