
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
            Input a number choice, 
            then press enter. 
            ".green
            
            choice = gets.chomp.to_i
            if  choice == 1
                bio_page          
            elsif choice == 2
                album_page
            elsif choice == 3
                top_tracks
            elsif choice == 4
                music_vids
            elsif choice == 5
                Menu.exit
            else 
                puts "Please enter a valid number".red
                sleep (2)
                Menu.new.start
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

        def self.es_exit
            system ('clear')
            font = TTY::Font.new(:doom)
            pastel = Pastel.new 
            puts pastel.green(font.write("adios"))
        end

        def self.exit
            system ('clear')
            font = TTY::Font.new(:doom)
            pastel = Pastel.new
            puts pastel.green(font.write("Goodbye!!"))
            abort
        end




    end




