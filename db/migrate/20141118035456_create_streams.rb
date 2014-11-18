class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :name
      t.string :description
      t.binary :stream

      t.timestamps
    end
  end
end
