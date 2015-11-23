class Customer < ActiveRecord::Base

  # DBから取得した性・名を結合してフルネームを返すメソッド
  def full_name
    full_name = family_name + given_name
    full_name
  end

  # バリデーションの定義
  # saveメソッドが呼ばれたタイミングで、モデルのバリデーションが実行される
  # バリデーションが通って保存されたらtrue
  # 通らなかったら保存しないでfalse
  validates :family_name,
    presence: true, length: { maximum: 20 }
  validates :given_name,
    presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true, format: { with: VALID_EMAIL_REGEX }

end
