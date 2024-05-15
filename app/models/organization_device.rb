class OrganizationDevice < ApplicationRecord
	enum status: {enabled:1,disabled:2} 
end
