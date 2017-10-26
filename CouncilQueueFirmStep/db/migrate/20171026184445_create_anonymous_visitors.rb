class CreateAnonymousVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :anonymous_visitors do |t|
      
 	  t.string :service
 	  t.string :visitor_type
      t.timestamps
    end
  end
end
