# I want this to:
# store albums
# I want each album to store a description
# I want each album to store a track list 
# Albums and descriptions are found here https://theaudiodb.com/api/v1/json/1/album.php?i=111450
# track lists are found https://theaudiodb.com/api/v1/json/1/track.php?m={TADB_Album_ID}



   
    class Albums
        
        def self.space
            puts " "
        end
        
        def self.album_menu
            system ('clear')
            response = Api.search_endpoint('album', '111450') 
           @@album_array = response["album"].map do |album|
               {
                    name: album["strAlbum"],
                    year: album["intYearReleased"],
                    id: album["idAlbum"]
                }

            end
            
            puts "
            

  █████  ██      ██████  ██    ██ ███    ███ ███████    
 ██   ██ ██      ██   ██ ██    ██ ████  ████ ██      ██ 
 ███████ ██      ██████  ██    ██ ██ ████ ██ ███████    
 ██   ██ ██      ██   ██ ██    ██ ██  ██  ██      ██ ██ 
 ██   ██ ███████ ██████   ██████  ██      ██ ███████    
                                                        
 ".green
            puts "______________________".blue
            space
            space        
                                                        
 
           
        
            @@album_array.each_with_index { |album, idx| puts "#{idx+1}. #{album[:name]}, #{album[:year]}" }
            space
            space
            puts "______________________".blue
            space        
            puts "Enter album number to view track list".yellow
            space
            open_album
        end

        def self.open_album
            @number = gets
            @number = @number.chomp
            @number = @number.to_i
            
            if  @number < 17
                @alb_idx = @number - 1          
            elsif @number > 16
                puts "Please enter a vailid number".red
                sleep (2)
                Albums.album_menu
            else
                Albums.album_menu
            end

            
            @@alb_id = @@album_array[@alb_idx][:id]
            
            alb_details = Api.track_search(@@alb_id)
            @@alb_pretty = alb_details["track"].map do |track|
                {
                    title: track["strTrack"],
                    duration: track["intDuration"],
                    genre: track["strGenre"],
                    album: track["strAlbum"]

                }

            end
            #  binding.pry
            system ("clear")
            space
            puts @@alb_pretty[1][:album].green
            puts "______________".blue
            @@alb_pretty.each_with_index { |track, idx| puts "#{idx+1}. #{track[:title]}" }

            space
            puts "______________".blue
            space
            
            puts "[1] Return to main menu".yellow
            puts "[2] Select a different album".yellow
            puts "[3] Get me out of here!".yellow

            choice = gets.strip
            case choice
            when "1"
                Menu.new.start
            when "2"
                Albums.album_menu 
            when "3"
                puts "See ya!".red
            end
        end


        
    end

       