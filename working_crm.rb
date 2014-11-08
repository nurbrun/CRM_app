require_relative './working_contact.rb'
require_relative './working_rolodex.rb'

class CRM
	attr_reader :name

	def initialize
		@rolodex = Rolodex.new
	end


	def main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit/n"
		puts "Enter a number:"
	end

	def main_menu_loop
		puts "Welcome to Nurbrun's CRM"
		loop do
			puts " "
			main_menu
			user_input=gets.chomp.to_i
			return if user_input==7
			option_selection(user_input)
		end
	end

	def option_selection (option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_one_contact
		when 5 then display_an_attribute
		when 6 then delete_a_contact
		when 7 
			puts "Goodbye!"
			return
		else
			puts "Invadlid option"
		end
	end

	def add_contact
		puts "First name:"
		first_name=gets.chomp
		puts "Last name:"
		last_name=gets.chomp
		puts "Email:"
		email=gets.chomp
		puts "Notes:"
		notes=gets.chomp

		contact = Contact.new(first_name,last_name,email,notes)
		@rolodex.add_contact(contact)

	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "First Name: #{contact.first_name} // Last Name: #{contact.last_name} // Email: #{contact.email} // Notes: #{contact.notes}"
			
		end
	end

	def display_one_contact
		puts "Please enter the contact's first name"
		contact_input = gets.chomp
	
  		contact = @rolodex.display_a_contact(contact_input)
		puts "First Name: #{contact.first_name} // Last Name: #{contact.last_name} // Email: #{contact.email} // Notes: #{contact.notes}"
	end



	def modify_contact
		puts "which contact would you like to make modifications to?"
		contact_to_mod = gets.chomp

		contact = @rolodex.display_a_contact(contact_to_mod)
        if contact.nil?
            puts "Contact not found"
            return
        end

        valid_fields = Contact.instance_methods(false).grep(/[^=]$/).map(&:to_s)
        loop do
            puts "What field do you want to change? (options: #{valid_fields})"
            field = gets.chomp
            begin
                # require 'pry'; binding.pry
                current_value = contact.send(field)
                puts "Current value of #{field} is: #{current_value}"
                puts
                puts "What do you want to change it to?" #make it so that the field to change is the same as the field lookup
                value = gets.chomp
                contact.send("#{field}=", value)

                puts "You have successfully updated a contact"
                puts "Updated contact entry: First Name: #{contact.first_name}, Last Name: #{contact.last_name}, Email: <#{contact.email}>, Note: #{contact.notes}, ID: #{contact.id}"
                return
            # rescue NoMethodError => e
                puts "You blew up the universe!!!!"
                puts "try again"
                return
            end
        end
	end	


	def modify_menu

		puts "Which attribute would you like to modify?"
		puts "[1] Change first name"
		puts "[2] Change last name"
		puts "[3] Change email"
		puts "[4] Change note"
		puts "[5] Exit this menu"

		@mod_selection = gets.chomp.to_i

		puts "You have selected #{@mod_selection}, do you confirm that you want to make changes? (Y/N)"
		confirmation = gets.chomp.upcase
		if confirmation == "Y"

			puts "What would you like to change it to?"
			@modified_attribute = gets.chomp

		elsif confirmation == "N"
			main_menu

		else 
			puts "Error command not recognized"
			main_menu
		end
	end


	def display_an_attribute

	print_search_menu

	array = Array.new



		if @what_to_display == 1
				puts "Enter text to search?"
				answer=gets.chomp
				contact = @rolodex.search_contact_by_first_name(answer)
			elsif @what_to_display == 2
				puts "Enter text to search?"
				answer=gets.chomp
			elsif @what_to_display == 3
				puts "Enter text to search?"
				answer=gets.chomp
			elsif @what_to_display == 4
				puts "Enter text to search?"
				answer=gets.chomp
			elsif @what_to_display == 5
				puts "Enter text to search?"
				answer=gets.chomp.to_i
				contact = @rolodex.search_contact_by_id(answer)
			elsif @what_to_display == 6
				print_main_menu
			else
				puts "Error command not recoginzed"
		end

		array.each do |search|
		puts search.first_name

		puts "Contacts that match this criteria: First Name: #{contact.first_name}, Last Name: #{contact.last_name}, Email: <#{contact.email}>, Note: #{contact.note}, ID: #{contact.id}"
	end

end




	def print_search_menu

		puts "What contact attribute do you want to search by?"
		puts "[1] if you want to search by first name"
		puts "[2] if you want to search by last name"
		puts "[3] if you want to search by email"
		puts "[4] if you want to search by note"
		puts "[5] if you want to search by ID"
		puts "[6] if you want to exit"

		@what_to_display = gets.chomp.to_i
	end



	# puts "Choose a contact to modify:"
	# contact_list = @rolodex.contacts.map.with_index do |contact, index|
	# 	"#{index.to_s} || #{contact.first_name} || #{contact.last_name}"
	# end
	# puts contact_list
	# selected = gets.chomp

	# puts "Choose by first name:"
	# @rolodex.contacts[selected].first_name = gets.chomp
		
	
	# #add more attributes

def delete_contact
		puts "Choose the ID of the contact you wish to delete:"
		@rolodex.contacts.each do |contact|
			puts "FIRST NAME: #{contact.first_name}, LAST NAME: #{contact.last_name}, EMAIL: #{contact.email}, NOTE: #{contact.note},  ID: #{contact.id}"
		end
		who_to_delete = gets.chomp.to_i
		@rolodex.contacts.each do |contact|
			if contact.id == who_to_delete
				@rolodex.contacts.delete(contact)
				puts "#{who_to_delete} HAS BEEN DELETED!"
			else
				puts "Sorry, Can't find that person."
			end
		end
	end
end

crm1 = CRM.new
crm1.main_menu_loop