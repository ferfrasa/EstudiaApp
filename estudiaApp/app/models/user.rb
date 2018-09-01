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
  has_many :students 
  has_many :schools
  has_many :sellers  
  has_attached_file :cover, 
  :styles => { :medium => "512x512>", :thumb => "400x400>", mini:"170x170" }
  #:default_url => "/images/normal/missing.png"

  #has_attached_file :cover, styles: { medium: "900x900", thumb:"600x600", mini:"200x200"},
  #:default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover , content_type: /\Aimage\/.*\Z/ #EXTENSION DE CUALQUIER IMAGEN
  include PermissionsConcern

  accepts_nested_attributes_for :teachers
  accepts_nested_attributes_for :students

 
  
            
end
