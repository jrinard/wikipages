class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :phone, :string
      t.column :web, :string
      t.column :hours, :string
      t.column :type_id, :integer
    end
  end
end
