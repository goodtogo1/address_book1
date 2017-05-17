def prompt
    puts
    puts "Welcome to the address book!"
    puts
    print "(1) Enter a new contact, \n(2) Print all contacts, \n(3) Edit a contact, \n(4) Delete a contact, \n(5) Exit \nEnter option: "
    selection = $stdin.gets.chomp.to_i
    case selection
    when 1
      enter_contact
      prompt
    when 2
      print_contacts
      prompt
    when 3
      edit_contact
      prompt
    when 4
      delete_contact
      prompt
    when 5
      puts
      puts "Application closed."
    else
      puts
      puts "Invalid selection. Please try again."
      puts
      prompt
    end
end

@contact_list = []

def enter_contact
  puts
  puts "Enter a contact's first name, last name, and phone number in the format: Jason, Smith, 212-555-1212"
  print "> "
  new_contact = $stdin.gets.chomp
  @contact_list << new_contact
  puts
  puts "Contact added: #{new_contact}"
end

def print_contacts
  puts
  puts "Contact list:"
  puts
  @contact_list.each {|x| puts x}
end

def delete_contact
  puts
  print "Enter contact name to delete: "
  delete_me = $stdin.gets.chomp
  @contact_list.delete(delete_me)
  puts
  puts "#{delete_me} was deleted."
end

def edit_contact
  puts
  print "Enter contact name to edit: "
  edit_from = $stdin.gets.chomp
  print "Enter new information for this contact: "
  edit_to = $stdin.gets.chomp
  @contact_list.each { |x|
    if (x == edit_from)
    x.replace(edit_to)
  end }
  puts
  puts "#{edit_from} was changed to #{edit_to}."
end

prompt
