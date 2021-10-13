class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  attachment :image
  
# Userモデルのカラムのバリデーションは以下の通りにし、有効でない場合はバリデーションエラーを返してください。
# name：一意性を持たせ、かつ2～20文字の範囲で設定してください。
# introduction：最大50文字までに設定してください。
  validates:name, presence:true, length:{minimum:2,maximum:20}, uniqueness:true
  validates:introduction,length:{maximum:50}
  
end
