class CreateWaterCounters < ActiveRecord::Migration[6.1]
  def change
    create_table :water_counters do |t|
      t.decimal :value
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
