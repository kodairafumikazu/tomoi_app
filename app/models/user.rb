class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { general: 0, admin: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one_attached :image
  has_many :orders
  has_many :addresses

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には6文字以上の半角英字と半角数字の両方を含めて設定してください'

  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角（漢字、ひらがな、カタカナ）文字を使用してください' } do
  end
  # with_options presence: true do
  #   validates :role
  # end
end
