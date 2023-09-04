class CreateTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.datetime :time
      t.decimal :value

      t.timestamps
    end
  end
end
