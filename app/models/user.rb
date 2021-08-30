class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    
  #   taken out the :database_authenticatable method from devise as it stores the passsword after hashing it in a 
  # another columnn not password so I have to close the session then test this as true later
  has_many :recipes
  has_many :comments, through: :recipes
    
  devise  :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: {in: 5..20}
  validates :email, presence: true
  validates :password, presence: true, length: {in: 8..20} 
end
  