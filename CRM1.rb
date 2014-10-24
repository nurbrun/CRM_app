require_relative './contact.rb'
require_relative './rolodex.rb'


class CRM
 attr_reader :name

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

def print_main_menu

	puts "[1] Add a contact"
	puts "[2] Modify a contact"
	puts "[3] Display all contacts"
	puts "[4] Display one contact"
	puts "[5] Display an attribute"
	puts "[6] Delete a contact"
	puts "[7] Exit/n"
	puts "Enter a number:"
end

def main_menu
	puts "Welcome to #{@name}"

	while true
		puts " "
		print_main_menu
		input=gets.chomp.to_i ####
		return if input == 7
		choose_option (input) #### allows you to pass through data to another method
		
	end

end

def choose_option(option)
	case option
	when 1 then add_contact
	when 2 then modify_contact
	when 3 then display_all_contacts
	when 4 then display_contact
	when 5
		display_attribute
	when 6
		delete_contact
	when 7
		puts "Goodbye!"
		return 
	else 
		puts "Invalid option. Try again"
	end	
end

def modify_contact
	puts "Choose a contact number to modify:"
	contacts_list = @rolodex.contacts.map.with_index do |contact, index|
		"#{index.to_s} #{contact.first_name} #{contact.last_name}"
	end
	puts contacts_list

	selected = gets.chomp
	puts "Choose a first name"
	@rolodex.contacts[selected].first_name = gets.chomp


### add other attributes


end






def add_contact
	print "First Name:"
	first_name = gets.chomp
	print "Last Name:"
	last_name = gets.chomp
	print "Email:"
	email = gets.chomp
	print "Note:"
	note = gets.chomp



	contact = Contact.new(first_name, last_name, email, note)
	@rolodex.add_contact(contact)

	end

def display_all_contacts
	@rolodex.contacts.each do |contact|
		puts "#{contact.first_name}<#{contact.last_name}<#{contact.email}"
end
end

def delete_contact
	puts "who would you like to delete?"
	@contacts
	@contacts.delete_if {|contacts| user_delete = @contacts }
	end



def display_contact
	puts "who are you looking for?"
	specific_contact = gets.chomp
	@rolodex
	if @rolodex.include?(specific_contact) == true
		puts "contact there!"
	else
		puts "not here"
end
end


# def display_contact
# 	@rolodex.contacts.each do |@contacts|
# 		if @rolodex.contacts.include?(user_input)
# 		puts "#{contact.first_name}<#{contact.last_name}<#{contact.email}"
# 	else
# 		puts "no account by that name"
# 	end

# end
		


end

crm = CRM.new ("Bitmaker labs CRM")
crm.main_menu

