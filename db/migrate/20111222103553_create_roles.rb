class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :descripcion

      t.timestamps
    end
    
    #Añadimos un usuario administrador
    say "Creando Roles"
    Role.create :name => "Webmaster", :descripcion => "Webmaster"
    Role.create :name => "Profesor", :descripcion => "Profesor"  
  
    
    
  end
  
  def down
    drop_table :roles
  end
end
