class Article < ApplicationRecord
 #validar los campos de la bd se hace en los modelos
   belongs_to :user
   has_many :comments
   validates :title, presence: true, uniqueness: true   #presence para que no se guarde vacio and uniqueness no se repiute
   validates :body , presence: true, length:{minimum: 20 }

  # validates :username , format:{with: /regex/ } #regex es expresion regulae
   before_create:set_visits_count

   def update_visits_count
   	 self.save if set_visits_count.nil?
   	 self.update(visits_count: self.visits_count + 1 )
   end


  private

  def set_visits_count
  	 self.visits_count  ||= 0  #si es nulo el campo asignele  0
  end
end
