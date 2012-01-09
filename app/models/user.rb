class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable,:registerable,
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable,
         :token_authenticatable, :timeoutable, 
         :lockable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nombre, :role_ids
  
  # Validaciones
  validates :nombre, :presence => true

  # Relaciones
  has_and_belongs_to_many :roles
  
  #metodos
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
end
