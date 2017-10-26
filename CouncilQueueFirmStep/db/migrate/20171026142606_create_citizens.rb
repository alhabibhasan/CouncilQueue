class CreateCitizens < ActiveRecord::Migration[5.0]
  def change
    create_table :citizens do |t|
    	t.string :visitor_type
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :service

      t.timestamps
    end
  end
end
