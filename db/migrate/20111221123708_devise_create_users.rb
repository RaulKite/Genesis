class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable
      t.string :nombre


      t.timestamps
    end
    
    say "Creando indices de los usuarios"
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :unlock_token,         :unique => true
    add_index :users, :authentication_token, :unique => true
    
    #Añadimos un usuario administrador
    say "Creando usuario administrador"
    
    User.create :nombre => "Admin", :email => "raul@um.es", :password =>"changeme"
    User.create :nombre => "Webmaster", :email => "webmaster@example.com", :password => "changeme"    
    User.create :nombre => "Profesor", :email => "profesor@example.com", :password => "changeme"    
    
  end
  
  def down
    drop_table :users
  end

end
