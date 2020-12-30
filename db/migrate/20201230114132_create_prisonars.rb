class CreatePrisonars < ActiveRecord::Migration[6.1]
  def change
    create_table :prisonars do |t|
      t.string :name
      t.text :code
      t.integer :win_count
      t.integer :lose_count

      t.timestamps
    end
  end
end
