class Top 
    
    def self.space
        puts " "
    end

   

    def self.top_menu
        system ("clear")
        response = Api.top_search('8f92558c-2baa-4758-8c38-615519e9deda')
        @@top_array = response["track"].map do |track|
            {
                title: track["strTrack"],
                album: track["strAlbum"],
                description: track["strDescriptionEN"],
                track_id: track["idTrack"]

            }
            end
        
        puts "
            


        ████████  ██████  ██████      ███████ ██ ██ 
           ██    ██    ██ ██   ██     ██      ██ ██ 
           ██    ██    ██ ██████      ███████ ██ ██ 
           ██    ██    ██ ██               ██       
           ██     ██████  ██          ███████ ██ ██ 
                                                               
                                            
        ".green
        puts "______________________".blue
        space
        space           
        @@top_array.each_with_index { |track, idx| puts "#{idx+1}. #{track[:title]}" }
        space
        space
        puts "______________________".blue
        space
        puts "Enter a track number to learn more".yellow
        track_info
    end

    def self.track_info
        
        @number = gets.chomp.to_i
        # @number = @number.chomp
        # @number = @number.to_i
        
        if @number < 6
            @trk_id = @number - 1
        elsif @number > 5
            puts "Please enter a vailid number".red
            sleep (2)
            Top.top_menu
        else
            Top.top_menu
        end
        

        @album = @@top_array[@trk_id][:album]
        @description = @@top_array[@trk_id][:description]
        @title = @@top_array[@trk_id][:title]
        system ("clear")
        puts "#{@title}".green
        puts "Album:  #{@album}".green
        space
        puts "______________________".blue
        space
        space        
        puts @description
        space
        space
        options
    end

    def self.options
        puts "______________________".blue
        space       
        puts "[1] Return to main menu".yellow
        puts "[2] Select a different track".yellow
        puts "[3] Get me out of here!".yellow

            choice = gets.chomp.to_i
            if choice == 1
                Menu.new.start
            elsif choice == 2
                Top.top_menu
            elsif choice == 3
                Menu.exit
            else
                puts "Please enter a vailid number".red
                sleep (2)
                Top.track_info
            end
                   
    end
end


   

    


       









        



    

