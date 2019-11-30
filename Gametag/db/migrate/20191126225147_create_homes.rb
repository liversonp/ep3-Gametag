class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :imagem
      t.text :descricao
      t.string :nome

      t.timestamps
    end
  end
end
