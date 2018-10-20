class RenameCountryOnEventToCountryCode < ActiveRecord::Migration[4.2]
  def change
    rename_column :events, :country, :country_code
  end
end
