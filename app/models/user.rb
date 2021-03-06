class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { general: 0, admin: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one_attached :image
  has_many :orders
  has_many :addresses
  has_many :sns_credentials, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には6文字以上の半角英字と半角数字の両方を含めて設定してください'

  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角（漢字、ひらがな、カタカナ）文字を使用してください' } do
  end
  # with_options presence: true do
  #   validates :role
  # end
  # def self.from_omniauth(auth)
  #   sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  #   # sns認証したことがあればアソシエーションで取得
  #   # 無ければemailでユーザー検索して取得orビルド(保存はしない)
  #   user = User.where(email: auth.info.email).first_or_initialize(
  #     name: auth.info.name,
  #     email: auth.info.email
  #   )
  #   # userが登録済みであるか判断
  #   if user.persisted?
  #     sns.user = user
  #     sns.save
  #   end
  #   { user: user, sns: sns }
  # end
  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          name: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        name: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end

end
