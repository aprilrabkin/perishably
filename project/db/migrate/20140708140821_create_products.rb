class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.date :expirationdate

      t.timestamps
    end
  end
end
