# module ClashApp
    class Menu
        
        system ("clear")
        system 'say "Welcome to the clash app"'
        def start       
            main_menu
        end
   
        def main_menu
            space
            puts "Welcome to ClashApp!!"
            space
            puts "[1] Biography"
            puts "[2] Albums"
            puts "[3] Exit"
            space
            puts "Enter number choice"
            
            choice = gets.strip
            case choice
            when "1"
               bio_page
            when "2"
                album_page  
            when "3"
              system 'say "Should I stay or should I go?"'
            end
        end

        def space
            puts " "
        end

        def bio_page
            Bio.display_bio
        end

        def album_page
            Albums.album_menu           
        end
    end





  


       







           
       

        
            


    #     def albums_menu
    #      # move to the api or response class method
    #       response = HTTParty.get("http://theaudiodb.com/api/v1/json/1/album.php?i=111450") 
    #       album_array = response["album"].map do |album|

    #                 {
    #                     name: album["strAlbum"],
    #                     year: album["intYearReleased"],
    #                     id: album["idAlbum"]
    #                 }
                    
    #          end

    #             # binding.pry
            
    #             # map over the album array and display dynamically
    #             puts "Albums:"
                
    #             album_array.each_with_index { |album, idx| puts "#{idx+1}. #{album[:name]}, #{album[:year]}" }
            
               
    #             puts "Enter Choice Number:"

    #             # album = ClashApp::Albums.find(album_name)
    #             # puts "#{album.name} Track List #{album.tracks}"
    #         end
    #     end
    # end

        
  
# end
       

       
                #     # move to the api or response class method
                #     response = HTTParty.get("http://theaudiodb.com/api/v1/json/1/search.php?s=the_clash") 
                #     # better_response = JSON.parse(response)
                #     bio_array = response["artists"].map do |bio|
        
                        
                    
        
                #         {
                #             bio_en: bio["strBiographyEN"],
                #             genre: bio["strGenre"],
                #             id: bio["idArtist"]
                #         }
                # #  binding.pry
                #     end

                #    bio_array.each  { |bio_en| puts "#{bio_en[:bio_en]}" }
                
                # main_menu
       
                