class User < ApplicationRecord
  has_many :items
  has_many :orders
  has_many :favorites
  has_many :favorite_items, through: :favorites, source: :item

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }
  validates :birth_date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: "Include both letters and numbers" }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: "Full-width characters" } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: "Full-width katakana characters"} do
    validates :last_name_kana
    validates :first_name_kana
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

end
