class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  has_many :endpoints

  validates :full_name, presence: true

  before_save :ensure_authentication_token!

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
