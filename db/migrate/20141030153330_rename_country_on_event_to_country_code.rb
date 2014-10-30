class RenameCountryOnEventToCountryCode < ActiveRecord::Migration
  def change
    rename_column :events, :country, :country_code
  end
end
