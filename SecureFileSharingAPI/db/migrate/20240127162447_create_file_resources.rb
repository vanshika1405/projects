class CreateFileResources < ActiveRecord::Migration[7.1]
  def change
    create_table :file_resources do |t|
      t.string :name
      t.binary :file_data

      t.timestamps
    end
  end
end
