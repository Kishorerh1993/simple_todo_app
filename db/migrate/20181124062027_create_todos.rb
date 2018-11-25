class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :note
      t.boolean :completed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
