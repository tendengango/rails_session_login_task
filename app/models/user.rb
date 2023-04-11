#class User < ApplicationRecord
 # validates :name, presence: true, length: { maximum: 30 }
 # validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
 # before_validation { email.downcase! }#transforme le mail en minuscule
 # has_secure_password# securiser le mot de pass en le hachant. password confirm sera créer automatiquement donc faut activer le gem bcrypt
 # validates :password, length: { minimum: 6 }
#end
class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :tasks
end
