
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
         

            choice = gets.strip
            case choice 
            when "1"
                english
            when "2"
                spanish
            when "3"
                Menu.new.start
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

            choice = gets.strip
            case choice
            when "1"
                spanish
            when "2"
                Menu.new.start
            when "3"
               puts "See ya!".red
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

           choice = gets.strip
           case choice
           when "1"
               english
           when "2"
               Menu.new.start
           when "3"
              puts "¡adiós!".red
           end
        end



    end


   
      