class AddPanelToFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :features, :panel, :string
  end
end
