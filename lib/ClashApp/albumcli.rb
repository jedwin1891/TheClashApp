 class AlbumCli
        
        def self.space
            puts " "
        end
                
        def self.album_menu
            
            system ('clear')
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
       
          Album.all.each_with_index { |album, idx| puts "#{idx+1}. #{album[:name]}, #{album[:year]}" }
            space
            space
            puts "______________________".blue
            space        
            puts "Enter album number to view track list".yellow
            space
            open_album
            
        end

        def self.open_album
            @number = gets.chomp.to_i            
            if  @number < 17
                @alb_idx = @number - 1          
            else    
                puts "Please enter a vailid number".red
                sleep (2)
                AlbumCli.album_menu
            end

            
            @@alb_id = Album.all[@alb_idx][:id]
            
            alb_details = Api.track_search(@@alb_id)
            @@alb_pretty = alb_details["track"].map do |track|
                {
                    title: track["strTrack"],
                    duration: track["intDuration"],
                    genre: track["strGenre"],
                    album: track["strAlbum"]

                }

            end
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

            choice = gets.strip.to_i

            if choice == 1
                Menu.main_menu
            elsif choice == 2
                AlbumCli.album_menu
            elsif choice == 3
                Menu.exit
            else
                puts "Please enter a vailid number".red
                sleep (2)
                AlbumCli.open_album
            end
        end
end


       