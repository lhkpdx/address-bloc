require_relative '../models/address_book'

 class MenuController
   attr_reader :address_book

   def initialize
     @address_book = AddressBook.new
   end

   def main_menu
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - View entry by number"
     puts "4 - Search for an entry"
     puts "5 - Import entries from a CSV"
     puts "6 - Exit"
     print "Enter your selection: "

     selection = gets.to_i
     case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         select_by_number
         puts "\n"
         main_menu
       when 4
         system "clear"
         search_entries
         main_menu
       when 5
         system "clear"
         read_csv
         main_menu
       when 6
         puts "Good-bye!"
         exit(0)
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
     end
   end

   def view_all_entries
     address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
       entry_submenu(entry)
     end
     system "clear"
     puts "End of entries"
   end

   def create_entry
     system "clear"
     puts "New AddressBloc Entry"
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
     address_book.add_entry(name, phone, email)
     system "clear"
     puts "New entry created"
   end

   def select_by_number
     puts "View Entry by Number"
     print "Which entry number would you like to see?  "
     choice = gets.chomp.to_i
     show_selection(choice)
   end

   def show_selection(choice)
     x = false
     address_book.entries.each do |entry|
       if choice == entry.number
         system "clear"
         print entry
         x = true
       end
     end
     if x == false
       selection_not_found
     end
   end

    def selection_not_found
      print "Whoops, that doesn't appear to be a valid choice. Would you like to try that again? (Y/N)  "
      answer = gets.chomp.downcase
      if answer == "y"
        select_by_number
      else
        system "clear"
        main_menu
      end
    end

   def search_entries
   end

   def read_csv
   end

   def entry_submenu(entry)
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     selection = gets.chomp

     case selection
       when "n"
       when "d"
       when "e"
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end
   end
