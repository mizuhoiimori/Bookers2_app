class Book < ApplicationRecord
  
  belongs_to :user
  
# Bookモデルのカラムのバリデーションは以下の通りにし、有効でない場合はバリデーションエラーを返してください。
# title：空でないように設定してください。
# body：空でない、かつ最大200文字までに設定してください。
  
  validates:title, presence:true
  validates:body, presence:true, length:{maximum:200}
  
end
