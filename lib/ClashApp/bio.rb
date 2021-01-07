# module ClashApp
    class Bio
        def self.space
            puts " "
        end

        def self.display_bio  
            system ("clear")
            puts "Biography:"
            puts "______________________"
            space
            space
            


            response = Api.search_endpoint('artist', '111450')
            bio_array = response["artists"].map do |bio|

                      {
                           bio_en: bio["strBiographyEN"],
                          genre: bio["strGenre"],
                             id: bio["idArtist"]
                     }
        
                end

              bio_array.each  { |bio_en| puts "#{bio_en[:bio_en]}" }
      
             space
             space
             puts "______________________"
             space
             puts "[1.] Return to Main Menu"
             puts "[2.] Go to Albums"
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
    end


   
      
        























#         def bio_page
#             # move to the api or response class method
#             response = HTTParty.get("http://theaudiodb.com/api/v1/json/1/search.php?s=the_clash") 
#             # better_response = JSON.parse(response)
#             bio_array = response["artists"].map do |bio|

#                 {
#                     bio_en: bio["strBiographyEN"],
#                     genre: bio["strGenre"],
#                     id: bio["idArtist"]
#                 }
        
#             end

#            bio_array.each  { |bio_en| puts "#{bio_en[:bio_en]}" }
#         end

        
        
#     end

   
# # end
       

           
  
    



        