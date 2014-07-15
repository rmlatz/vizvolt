class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state
      t.string :fuel_code
      t.string :year
      t.decimal :production
    end
  end
end
