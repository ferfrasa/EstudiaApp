class Article < ApplicationRecord
  include AASM
  #maquina de estado de a gema AASM
  #validar los campos de la bd se hace en los modelos
   belongs_to :user
   has_many :comments, dependent: :destroy 
   has_many :has_category_as
   has_many :category_as, through: :has_category_as
   validates :title, presence: true, uniqueness: true   #presence para que no se guarde vacio and uniqueness no se repiute
   validates :body , presence: true, length:{minimum: 20 }

  # validates :username , format:{with: /regex/ } #regex es expresion regulae
   before_create :set_visits_count
   after_create :save_categories  #despues de guardar el articulo guardar categoria muchos a muchos

   
   has_attached_file :cover, styles: { medium: "1280x720", thumb:"800x600", mini:"400x200"}
   validates_attachment_content_type :cover , content_type: /\Aimage\/.*\Z/ #EXTENSION DE CUALQUIER IMAGEN
   
   scope :publicados, -> {where(state: "published")}
   scope :ultimos ,-> {order("created_at DESC")}

   #def self.publicados
     #Article.where(state:"published")
   #end

   #custom setter
   def category_as=(value)
      puts 'que pas1'
      puts @category_as.inspect
   
       @category_as = value
       puts 'que pas2'
    puts @category_as.inspect
   
      
   end
 
   def update_visits_count
   	 self.save if set_visits_count.nil?
   	 self.update(visits_count: self.visits_count + 1 )
   end

   aasm column: "state" do
     state :in_draft , initial: true
     state :published

     event :publish do
      transitions from: :in_draft, to: :published
     end
     
     event :unpublish do
      transitions from: :published , to: :in_draft
     end 
      
   end


  private

  def save_categories
  
    puts 'que pas3'
    puts @category_as.inspect
    puts @category_as.to_yaml
   
    @category_as.each do |category_id|
      HasCategoryA.create(category_a_id: category_id , article_id: self.id)  
    end
    
  end
  

  def set_visits_count
  	 self.visits_count  ||= 0  #si es nulo el campo asignele  0
  end
end
