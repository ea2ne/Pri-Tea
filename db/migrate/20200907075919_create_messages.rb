class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :text, presence: true
      t.string :grade, presence: true
      t.string :subject, presence: true
      t.text :image
      t.timestamps
    end
  end
end
