class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :user_type
  has_many :articles 
  has_many :teachers
  has_many :universities    
  has_many :comments 
  include PermissionsConcern

  accepts_nested_attributes_for :teachers
            
end
