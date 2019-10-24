class CreateAvailabilitiesTable < ActiveRecord::Migration[6.0]
  def change
      create_table :availabilities do |t|
        t.belongs_to :spaces
        t.belongs_to :requests 
        t.datetime :date_offered
        t.datetime :created_at
      end
  end
end
