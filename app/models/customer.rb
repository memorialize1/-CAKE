class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #バリデーションについて
  validates :l_name,  presence: true
  validates :f_name, presence: true
  validates :l_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :f_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  #カタカナ制限
  validates :phone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/, message: '10桁か11桁の電話番号を入力してください。'}
  #このカラムに対し、10か11文字の数列以外を入力できないようにする
  validates :post_code,  presence: true, format: {with: /\A\d{7}\z/}
  #郵便番号７桁固定
  validates :address, presence: true
  
  has_many :cart_items, dependent: :destroy
  has_many :ship_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
         
end
