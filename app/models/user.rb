class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: {
    with: PASSWORD_REGEX,
    message: 'は半角英数を両方含む必要があります'
  }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {
    with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
    message: 'は全角（ひらがな・カタカナ・漢字）のみで入力してください'
  }
  validates :first_name, presence: true, format: {
    with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
    message: 'は全角（ひらがな・カタカナ・漢字）のみで入力してください'
  }
  validates :last_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: 'は全角カタカナのみで入力してください'
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: 'は全角カタカナのみで入力してください'
  }
  validates :birthday, presence: true

end
