
    class Menu
        
        system ("clear")
        def start       
            main_menu
        end
   
        def main_menu
            system ("clear")
            space
            puts "  
            ╔═╗┬  ┌─┐┌─┐┬ ┬╔═╗┌─┐┌─┐┬┬
            ║  │  ├─┤└─┐├─┤╠═╣├─┘├─┘││
            ╚═╝┴─┘┴ ┴└─┘┴ ┴╩ ╩┴  ┴  oo 
            ".green
            
           
            space
            puts "
            [1] Biography
            ".yellow
            puts "
            [2] Albums
            ".yellow
            puts "
            [3] Top 5 Songs
            ".yellow
            puts "
            [4] Music Videos
            ".yellow
            puts "
            [5] Exit
            ".yellow
            space
            puts "
            Enter number choice
            ".green
            
            choice = gets.strip
            case choice
            when "1"
               bio_page
            when "2"
                album_page  
            when "3"
                top_tracks
            when "4"
                music_vids
            when "5"
                #system 'say "Should I stay or should I go?"'
            end
        end

        def space
            puts " "
        end

        def bio_page
            Bio.getinfo
        end

        def album_page
            Albums.album_menu           
        end

        def top_tracks
            Top.top_menu
        end

        def music_vids
            Video.display
        end


    end




