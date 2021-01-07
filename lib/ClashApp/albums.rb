# I want this to:
# store albums
# I want each album to store a description
# I want each album to store a track list 
# Albums and descriptions are found here https://theaudiodb.com/api/v1/json/1/album.php?i=111450
# track lists are found https://theaudiodb.com/api/v1/json/1/track.php?m={TADB_Album_ID}


# module ClashApp
   
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
            
            puts "Albums:"
            puts "______________"
            space
        
            @@album_array.each_with_index { |album, idx| puts "#{idx+1}. #{album[:name]}, #{album[:year]}" }
            space
            space
            puts "Select album number to learn more!"
            space
            open_album
        end

        def self.open_album
            @number = gets
            @number = @number.chomp
            @number = @number.to_i
            @alb_idx = @number - 1
            
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

            puts @@alb_pretty[1][:album]
            puts "______________"
            @@alb_pretty.each_with_index { |track, idx| puts "#{idx+1}. #{track[:title]}" }

            space
            space
            puts "______________"

            
            puts "[1.] Return to main menu"
            puts "[2.] Select a different album"
            puts "[3.] Get me out of here!"

            choice = gets.strip
            case choice
            when "1"
                self.main_menu
            when "2"
                Albums.album_menu 
            when "3"
                puts "See ya!"
            end
        end
        
        def self.main_menu
            Menu.new.start
        end
        
        # def self.load
        #     self.new.start
        # end

    end

       





































    #    attr_accessor :name, :tracks

    #    def self.load_data
    #     ClashApp::Scraper.new.load
       



        
        #which means that when  I instantiate an album 
        #the album class has to remember all the albums 
        #in memory so that later on, I can iterate through 
        #all this instances and find the one that matches 
        #the name and return it.
#        end

#   
      


    





    
