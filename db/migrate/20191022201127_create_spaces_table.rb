class CreateSpacesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.belongs_to :availabilities
      t.string :name
      t.string :description
      t.integer :ppnd
      t.datetime :created_at
    end
  end
end
