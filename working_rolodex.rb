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
		nil
	end

	def search_contact_by_first_name (name)

		array = []

		@contacts.each do |contact|


			if contact.first_name == name 

			array << contact

			end

		end

		return array


	end


	def search_contact_by_id (id)

		array = []

		@contacts.each do |contact|


			if contact.id == id
			array << contact

			end
		end
		return array
	end


end
