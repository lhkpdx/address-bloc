def greeting
  first_arg, *the_rest = ARGV
  the_rest.each do |arg|
       puts "#{first_arg} #{arg}!"
  end
end

greeting
