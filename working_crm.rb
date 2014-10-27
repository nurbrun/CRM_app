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
		while true
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
		when 5 then display_an attribute
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
	puts "Choose a contact to modify:"
	contact_list = @rolodex.contacts.map.with_index do |contact, index|
		"#{index.to_s} || #{contact.first_name} || #{contact.last_name}"
	end
	puts contact_list
	selected = gets.chomp

	puts "Choose by first name:"
	@rolodex.contacts[selected].first_name = gets.chomp
		
	
	#add more attributes
	

	end


end

crm1 = CRM.new
crm1.main_menu_loop