class Entry
attr_accessor :name, :phone_number, :email, :number

def initialize(name, phone_number, email, number)
  @name = name
  @phone_number = phone_number
  @email = email
  @number = number
   end

   def to_s
     "Number: #{number}\nName: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
   end
end
