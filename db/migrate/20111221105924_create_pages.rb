class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :titulo
      t.text :contenido
      t.string :permalink
      t.string :tags

      t.timestamps
    end
  end
  
  def down
    drop_table :pages
  end
end
