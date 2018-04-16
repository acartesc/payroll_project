class AddFileToWorker < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :file, :string
  end
end
