class Role < ActiveRecord::Base
  #Relaciones
  has_and_belongs_to_many :users
  
  #Validaciones
  validates :name, :presence => true
  validates :descripcion, :presence => true

end
