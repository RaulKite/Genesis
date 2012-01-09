class CreateUsersRolesTable < ActiveRecord::Migration
  def up
    create_table :roles_users do |t|
        t.references :user
        t.references :role
        t.timestamps
    end


    say "Anadiendo usuario Superadministrador a grupo superadministrador"
    @user = User.find(2)
    @user.roles << Role.find(1)
    @user = User.find(3)
    @user.roles << Role.find(2)
      
  end

  def down
    drop_table :roles_users
  end
end