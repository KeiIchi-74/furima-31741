class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true, uniqueness: true
  validates :email, uniqueness: true
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

end
