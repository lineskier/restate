class Estate < ActiveRecord::Base
	
	geocoded_by :address
	after_validation :geocode

	belongs_to :user
	belongs_to :estate_type
	mount_uploader :image, ImageUploader

def self.to_csv(options = {})
	CSV.generate(options) do |csv|
		csv << column_names
		all.each do |estate|
			csv << estate.attributes.values_at(*column_names)
		end
	end
end


def self.buy
	self.status = 'niedostepne'
end


end
