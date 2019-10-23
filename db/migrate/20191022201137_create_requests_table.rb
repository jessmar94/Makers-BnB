class CreateRequestsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.belongs_to :user
      t.belongs_to :space
      t.date :start_date
      t.date :end_date
      t.string :status
      t.datetime :created_at
    end
  end
end
