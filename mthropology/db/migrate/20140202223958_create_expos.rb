class CreateExpos < ActiveRecord::Migration
  def change
    create_table :expos do |t|
      t.text :title
      t.text :body
      t.text :tag
      t.references :user, index: true

      t.timestamps
    end
  end
end
