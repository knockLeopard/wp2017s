class CreatePapers < ActiveRecord::Migration[5.1]
  def change
    create_table :papers do |t|
      t.string :url
      t.string :company
      t.string :content
      t.text :comment

      t.timestamps
    end
  end
end
