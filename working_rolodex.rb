class Rolodex
	attr_reader :contacts
@@index=1000

	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.index = @@index
		@@index+=1
		@contacts<<contact
	end

	def display_a_contact(first_name)
		@contacts.each do |contact|
			if contact.first_name == first_name
				return contact
			end
			
		end
	end



end
