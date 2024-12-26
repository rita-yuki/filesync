class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.date :received_date
      t.string :document_name
      t.integer :quantity
      t.string :customer_name
      t.date :start_date
      t.date :end_date
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end