class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  #Relations
  has_many :tweets

  #follows relations
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  has_many :followees, through: :followed_users, source: :followee

  has_many :follower_users, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :follower_users, source: :follower

  attr_writer :login 

  def login
    @login || self.username || self.email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def can_follow?(user)
    return false if self == user || Following.where(follower_id: self.id, followed_id: user.id).exists?
    return true
  end

  def can_unfollow?(user)
    if Following.where(follower_id: self.id, followed_id: user.id).exists? 
      return true 
    end
    return false
  end

  def follow_user(user)
    if self.can_follow?(user)
      Following.create(follower_id: self.id, followed_id: user.id)
    end
  end

  def unfollow_user(user)
    if self.can_unfollow?(user)
      Following.where(follower_id: self.id, followed_id: user.id).destroy_all
    end
  end

end
