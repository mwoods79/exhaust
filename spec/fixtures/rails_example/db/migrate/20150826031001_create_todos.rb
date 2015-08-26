class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
    end
  end
end
