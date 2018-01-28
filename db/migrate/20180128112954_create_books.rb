class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :author, foreign_key: true
      t.integer :page_num
      t.string :title

      t.timestamps
    end
  end
end
