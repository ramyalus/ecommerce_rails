class ChangeColumnInProducts < ActiveRecord::Migration
  def change
  	change_column :products, :cod_eligible,  'boolean USING CAST(cod_eligible AS boolean)', :default => false
  end
end
