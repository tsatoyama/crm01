class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      # Modify Start
      # t.string :family_name
      # t.string :given_name
      # t.string :email
      t.string :family_name, null: false, length: { maximum: 20 }
      t.string :given_name,  null: false, length: { maximum: 20 }
      t.string :email,       null: false
      # Modify End

      t.timestamps null: false
    end
    # Add Start
    add_index :customers, :email, unique: true
    # Add End
  end
end

