
    class Bio
        def self.space
            puts " "
        end
        def self.getinfo
            response = Api.search_endpoint('artist', '111450')
            @@bio_array = response["artists"].map do |bio|
                     {
                           bio_en: bio["strBiographyEN"],
                           bio_es: bio["strBiographyES"],
                          genre: bio["strGenre"],
                             id: bio["idArtist"]
                     }       
                end
             menu
        end

        def self.menu  
            system ("clear")
            space
            puts "
            Select Language
            ".green
            puts "
            [1] English
            ".yellow
            puts "
            [2] Español
            ".yellow
            puts "
            [3] Main menu
            ".yellow
         

            choice = gets.strip.to_i
            if choice == 1
                english
            elsif choice == 2
                spanish
            elsif choice == 3
                Menu.new.start
            else
                puts "Please enter a vailid number".red
                sleep (2)
                menu
            end
        end
        
        def self.english
            system ("clear")
            puts "


██████  ██  ██████   ██████  ██████   █████  ██████  ██   ██ ██    ██    
██   ██ ██ ██    ██ ██       ██   ██ ██   ██ ██   ██ ██   ██  ██  ██  ██ 
██████  ██ ██    ██ ██   ███ ██████  ███████ ██████  ███████   ████      
██   ██ ██ ██    ██ ██    ██ ██   ██ ██   ██ ██      ██   ██    ██    ██ 
██████  ██  ██████   ██████  ██   ██ ██   ██ ██      ██   ██    ██       
                                                                         
                                                                         
            
            ".green
            puts "______________________".blue
            space
            space                   
            @@bio_array.each  { |bio_en| puts "#{bio_en[:bio_en]}" }
      
             space
             space
             puts "______________________".blue
             space
             puts "[1] View in Spanish".yellow
             puts "[2] Main menu".yellow
             puts "[3] Get me out of here!".yellow

            choice = gets.strip.to_i
            if choice == 1
                spanish
            elsif choice == 2
                Menu.new.start
            elsif choice == 3
                Menu.exit
            else
                puts "Please enter a vailid number".red
                sleep (2)
                english
            end
        end

        def self.spanish
            system ("clear")
            puts "

██████  ██  ██████   ██████  ██████   █████  ███████  █████  
██   ██ ██ ██    ██ ██       ██   ██ ██   ██ ██      ██   ██ 
██████  ██ ██    ██ ██   ███ ██████  ███████ █████   ███████ 
██   ██ ██ ██    ██ ██    ██ ██   ██ ██   ██ ██      ██   ██ 
██████  ██  ██████   ██████  ██   ██ ██   ██ ██      ██   ██ 
                                                             
                                                             
".green
    
            puts "______________________".blue
            space
            space                   
            @@bio_array.each  { |bio_es| puts "#{bio_es[:bio_es]}" }
            space
            space
            puts "______________________".blue
            space
            puts "[1] Ver en English".yellow
            puts "[2] Menú principal".yellow
            puts "[3] ¡Sácame de aquí!".yellow

           choice = gets.strip.to_i
           if choice == 1
               english
           elsif choice == 2
               Menu.new.start
           elsif choice == 3
               Menu.exit
           else
               puts "por favor ingrese un número valido".red
               sleep (2)
               spanish
           end
        end



    end


   
      