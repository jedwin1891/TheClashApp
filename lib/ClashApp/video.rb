class Video 
    
    def self.space
        puts " "
    end

    def self.display
        system ("clear")
        puts "
        
███    ███ ██    ██ ███████ ██  ██████     ██    ██ ██ ██████  ███████  ██████  ███████ 
████  ████ ██    ██ ██      ██ ██          ██    ██ ██ ██   ██ ██      ██    ██ ██      
██ ████ ██ ██    ██ ███████ ██ ██          ██    ██ ██ ██   ██ █████   ██    ██ ███████ 
██  ██  ██ ██    ██      ██ ██ ██           ██  ██  ██ ██   ██ ██      ██    ██      ██ 
██      ██  ██████  ███████ ██  ██████       ████   ██ ██████  ███████  ██████  ███████ 
                                                                                        
                                                                                        

        ".green
        puts "______________________".blue
        space
        space        
        display_vid
    end

    def self.display_vid
        response = Api.search_endpoint('mvid', '111450')
        @@vid_array = response["mvids"].map do |mvids|
            {
                 title: mvids["strTrack"],
                 link: mvids["strMusicVid"],
                 id: mvids["idAlbum"]
             }
            end
        #@url = @@vid_array[]     
        @@vid_array.each { |mvids, idx| puts TTY::Link.link_to("#{mvids[:title]}", "#{mvids[:link]}".blue) }

        puts "To open URL, CTRL + click.".red
      
        options
    end

    def self.options
        puts "______________________".blue
        space       
        puts "[1] Return to main menu".yellow
        puts "[2] Get me out of here!".yellow

            choice = gets.strip
            case choice
            when "1"
                Menu.new.start  
            when "2"
                puts "See ya!".red
            end
                   
    end




end
