class CreateElectricityCounters < ActiveRecord::Migration[6.1]
  def change
    create_table :electricity_counters do |t|
      t.decimal :value
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
