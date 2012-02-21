class Contact
	attr_accessor :contact_id, :name, :surname, :age, :tel
	
	def setContact_id
		if $pb.length == 0
			contact_id = 1
		else
			contact_id = ($pb.last.contact_id.to_i + 1)
		end
	end
	
	def setName(t='o')
		if t == 'o'
			print '=> Digit Contact name: '
		else
			print '=> Digit Contact new name: '
		end
		name = gets.chomp
		puts
		name
	end
	
	def setSurname(t='o')
		if t == 'o'
			print '=> Digit Contact surname: '
		else
			print '=> Digit Contact new surname: '
		end
		surname = gets.chomp
		puts
		surname
	end
	
	def setAge(t='o')
		if t == 'o'
			print '=> Digit Contact age: '
		else
			print '=> Digit Contact new age: '
		end
		age = gets.chomp
		puts
		age
	end
	
	def setTel(t='o')
		if t == 'o'
			print '=> Digit Contact phone number: '
		else
			print '=> Digit Contact new phone number: '
		end
		tel = gets.chomp
		puts
		tel
	end
end

class PhoneBook
  attr_accessor :pbfm

  def initialize
    clearScreen
 	  $file_name = 'contacts.xml'
    $pb=[] #phoneBook array
    self.pbfm = PBFileManager.new
    self.pbfm.readFile
  end
	def insertContact
	  @@c = Contact.new
		@@c.contact_id = @@c.setContact_id
		@@c.name = @@c.setName
		@@c.surname = @@c.setSurname
		@@c.age = @@c.setAge
		@@c.tel = @@c.setTel		
		$pb << @@c
	end
	
	def listContacts
		if $pb.length == 0
			puts "\n Contacts list is empty.\n\n"
			sleep(2)
			clearScreen
		else
			for c in $pb do
				puts "=> Contact ##{c.contact_id}:"
				puts "   Name: #{c.name}"
				puts "   Surname: #{c.surname}"
				puts "   Age: #{c.age}"
				puts "   Phone Number: #{c.tel}"
				puts
			end
		end
	end
	
	def editContacts
		if $pb.length > 0
			begin
				clearScreen
				listContacts
				@@id = 0
				@@ans = false
				print '=> Choose a Contact ID to edit (press 0 to go back to Main Menu): '
				@@id = gets.chomp
				
				if @@id == 0.to_s
			    @@ans = true
			    clearScreen
			    menu
				else
				  for c in $pb do
					  if c.contact_id.to_s == @@id
						  @@ans = true
					  end
				  end
				end
				if @@ans == false
					clearScreen
					puts "\n Invalid option! Try again please."
					sleep(2)
				end
			end while(@@ans == false)
			if @@id != 0.to_s
  			editMenu
  		end
		else
		  listContacts
			menu
		end
	end
	
	def editMenu
		begin
	 		clearScreen
			showContact
			puts ":: Edit Menu ::\n\n"
			puts ' (1) Name;'
			puts ' (2) Surname;'
			puts ' (3) Age;'
			puts ' (4) Phone Number;'
			puts ' (5) Change everything;'
			puts ' (6) Back to Edit Contacts;'
			puts ' (7) Back to Main Menu;'
			print "\n=> Choose a field to edit (1-7): "
			editOpt = gets.chomp
			if(editOpt != 1.to_s && editOpt != 2.to_s && editOpt != 3.to_s && editOpt != 4.to_s && editOpt != 5.to_s && editOpt != 6.to_s && editOpt != 7.to_s)
				clearScreen
				puts "\n Invalid option! Try again please."
				sleep(2)
			end
		end while(editOpt != 1.to_s && editOpt != 2.to_s && editOpt != 3.to_s && editOpt != 4.to_s && editOpt != 5.to_s && editOpt != 6.to_s && editOpt != 7.to_s)
		
		if editOpt == 1.to_s
			for c in $pb
				if c.contact_id == @@id
					clearScreen
					showContact
					c.name = c.setName('n')
				end
			end
			editMenu
		elsif editOpt == 2.to_s
			for c in $pb
				if c.contact_id == @@id
					clearScreen
					showContact
					c.surname = c.setSurname('n')
				end
			end
			editMenu
		elsif editOpt == 3.to_s
			for c in $pb
				if c.contact_id == @@id
					clearScreen
					showContact
					c.age = c.setAge('n')
				end
			end
			editMenu
		elsif editOpt == 4.to_s
			for c in $pb
				if c.contact_id == @@id
					clearScreen
					showContact
					c.tel = c.setTel('n')
				end
			end
			editMenu
		elsif editOpt == 5.to_s
			for c in $pb
				if c.contact_id == @@id
					clearScreen
					showContact
					c.name = c.setName('n')
					c.surname = c.setSurname('n')
					c.age = c.setAge('n')
					c.tel = c.setTel('n')
				end
			end
			editMenu
		elsif editOpt == 6.to_s
			editContacts
		elsif editOpt == 7.to_s
		  clearScreen
			menu
		end
	end
	
	def showContact
		for c in $pb
			if c.contact_id == @@id
				puts "=> Contact ##{c.contact_id}:"
				puts "   Name: #{c.name}"
				puts "   Surname: #{c.surname}"
				puts "   Age: #{c.age}"
				puts "   Phone Number: #{c.tel}"
				puts
			end
		end
	end
	
	def deleteContact
	  if $pb.length > 0
		  begin
		    clearScreen
		    listContacts
		    @@id = 0
		    @@ans = false
		    print '=> Choose a Contact ID to delete (press 0 to go back to Main Menu, or -1 to delete all Contacts): '
			  @@id = gets.chomp
			  if @@id == 0.to_s
			    @@ans = true
			    clearScreen
			    menu
			  elsif @@id == -1.to_s
			    begin
  			    print "\n => Are you sure you wanto to delete all Contacts? (s/n) "
  			    ans = gets.chomp
  			    clearScreen
            if (ans.upcase != 'S' && ans.upcase != 'N')          			    
       				puts "\n Invalid option! Try again please."
	      			sleep(2)
      				clearScreen
  			    end
  			  end while(ans.upcase != 'S' && ans.upcase != 'N')
			    if ans.upcase == 'S'
  			    $pb = []
  			    puts '\n All Contacts were deleted!'
  			    sleep(2)
  			  else
  			    deleteContact
  			  end
	 		    @@ans = true
			    clearScreen
			  else
			    for c in $pb do
				    if c.contact_id.to_s == @@id
					    @@ans = true
      			end
			    end
			  end
		  end while(@@ans == false)
		  if @@id != 0.to_s && @@id != -1.to_s
		    for c in $pb do
      			$pb.delete(c) if c.contact_id == @@id
		    end
		  end
	  else
		   listContacts
		   menu
		end
	end

	def menu	
		begin
			puts ":: PhoneBook Main Menu ::\n\n"
			puts " (1) List Contacts;"
			puts " (2) Insert Contact;"
			puts " (3) Edit Contacts;"
			puts " (4) Delete Contact;"
			puts " (5) Change file;"
			puts " (0) Exit PhoneBook;"
			print "\n=> Choose an option (0-5): "
			ans = gets.chomp
			clearScreen
			if(ans != 1.to_s && ans != 2.to_s && ans != 3.to_s && ans != 4.to_s && ans != 5.to_s && ans != 0.to_s)
				puts "\n Invalid option! Try again please."
				sleep(2)
				clearScreen
			end
		end while(ans != 1.to_s && ans != 2.to_s && ans != 3.to_s && ans != 4.to_s && ans != 5.to_s && ans != 0.to_s)

		if ans == 1.to_s
			listContacts
			menu
		elsif ans == 2.to_s
			insertContact
			clearScreen
			menu
		elsif ans == 3.to_s
			editContacts
			clearScreen
			menu
		elsif ans == 4.to_s
			deleteContact
			clearScreen
			menu
		elsif ans == 5.to_s
		  pbfm.changeFileName
		  clearScreen
		  menu
		elsif ans == 0.to_s
			fm = PBFileManager.new
			fm.writeFile
			exit
		end
	end
	
	def clearScreen
		p = /^.*linux.*$/
		if p.match(RUBY_PLATFORM)
			system "clear"
		else
			system "cls"
		end
	end
end

class PBFileManager
	attr_accessor :cont, :cid, :name, :sname, :age, :phone
	
	def initialize()
	  self.cont = Contact.new
    self.cid = false
    self.name = false
    self.sname = false
    self.age = false
    self.phone = false
	end
	
	def changeFileName
    print "\n => Enter the new file name (press 0 to go back to Main Menu): "
    ans = gets.chomp
    if ans != 0.to_s
      $file_name = ans
    else
      pb = PhoneBook.new
      pb.clearScreen
      pb.menu
    end
    $pb = []
    readFile
	end
	
	def writeFile
		if $pb.length > 0
			puts "Saving Contacts in #{$file_name}...\n\n"
			File.open($file_name, 'w+') do |f|
				f.puts '<phoneBookContacts>'
				for c in $pb do
					f.puts '	<contact>'
					f.puts '		<contact_id>' << c.contact_id.to_s << '</contact_id>'
					puts "Contact ##{c.contact_id.to_s}"
					f.puts '		<name>' << c.name << '</name>'
					puts "Name: #{c.name}"
					f.puts '		<surname>' << c.surname << '</surname>'
					puts "Surname: #{c.surname}"
					f.puts '		<age>' << c.age << '</age>'
					puts "Age: #{c.age}"
					f.puts '		<tel>' << c.tel << '</tel>'
					puts "Phone Number: #{c.tel}\n\n"
					f.puts '	</contact>'
				end
				f.puts '</phoneBookContacts>'
			end
		else
			File.open($file_name, 'w+') do |f|
				f.puts 'PhoneBook Contacts list is empty.'
			end
		end
	end
	
	def readFile
    File.open($file_name, 'a+') do |f|
    @@pbc = false
    @@end_pbc = false
    @@contact = false
    @@end_contact = false
    @@comment_on = false
    @@line_num = 0
    p1 = /(^.+\s*<phoneBookContacts>\s*.*$)|(^.*\s*<phoneBookContacts>\s*.+$)/i
    commentPat = /^.*(<!--.*-->).*$/
    while line = f.gets
      @@line_num += 1
      line.strip!
      if commentPat.match(line)
        line = line.gsub(/<!--.*-->/,'')
      end
      if /^.*(<!--).*$/.match(line)
         @@comment_on = true
      end
      if /^.*(-->).*$/.match(line)
         @@comment_on = false
      end
      
      if line.downcase == '<phonebookcontacts>'
        @@pbc = true
	  elsif line == 'PhoneBook Contacts list is empty.'
		puts "\n PhoneBook Contacts list is empty."
		p = /^.*linux.*$/
		sleep(2)
		if p.match(RUBY_PLATFORM)
			system "clear"
		else
			system "cls"
		end
      elsif p1.match(line) || !@@pbc
        puts 'Invalid XML format.'
        puts "Please check your XML document (#{$file_name})...(line ##{@@line_num})"
        exit
      elsif line.downcase == '</phonebookcontacts>'
        @@end_pbc = true
      elsif line.downcase == '<contact>'
        @@contact = true
        @@end_contact = false
      elsif line.downcase == '</contact>'
        @@end_contact = true
        @@contact = false
      end
      #puts "#{line.length} | #{line}"
      if @@pbc && !@@end_pbc && @@contact && !@@end_contact && line.length > 0 && !@@comment_on
        if (line[0,12].downcase == '<contact_id>') && (line[-13,13].downcase == '</contact_id>')
          cont.contact_id = line[12,line.length - 25]
          cid = true
          #puts "contact_id: #{cont.contact_id}"
        elsif (line[0,6].downcase == '<name>') && (line[-7,7].downcase == '</name>')
          cont.name = line[6,line.length - 13]
          name = true
          #puts "name: #{cont.name}"
        elsif (line[0,9].downcase == '<surname>') && (line[-10,10].downcase == '</surname>')
          cont.surname = line[9,line.length - 19]
          sname = true
          #puts "surname: #{cont.surname}"
        elsif (line[0,5].downcase == '<age>') && (line[-6,6].downcase == '</age>')
          cont.age = line[5,line.length - 11]
          age = true
          #puts "age: #{cont.age}"
        elsif (line[0,5].downcase == '<tel>') && (line[-6,6].downcase == '</tel>')
          cont.tel = line[5,line.length - 11]
          phone = true
          #puts "tel: #{cont.tel}"
        elsif line.downcase != '<contact>' && line.downcase != '<phonebookcontacts>' && line.downcase != '</contact>' && line.downcase != '</phonebookcontacts>' && !@@pbc
          puts 'Invalid XML format.'
          puts "Please check your XML document (#{$file_name})...(line ##{@@line_num})"
          exit
        end
      end
      if cid && name && sname && age && phone && @@end_contact && !@@contact
        $pb << cont
        self.cont = Contact.new
        cid = false
        name = false
        sname = false
        age = false
        phone = false
      end
    end
    end
  end
end

myPB = PhoneBook.new
myPB.menu
