class Customer < ActiveRecord::Base

  # DBから取得した性・名を結合してフルネームを返すメソッド
  def full_name
    full_name = family_name + given_name
    full_name
  end

end
