class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
    	t.string :visitor_type
    	t.string :name
    	 t.string :service
      t.timestamps
    end
  end
end
