class TopCli 
    
    def self.space
        puts " "
    end

    def self.top_menu
        system ("clear")

        
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
        Top.all.each_with_index { |track, idx| puts "#{idx+1}. #{track[:title]}" }
        space
        space
        puts "______________________".blue
        space
        puts "Enter a track number to learn more".yellow
        track_info
    end

    def self.track_info
        
        @number = gets.chomp.to_i
             
        if @number < 6
            @trk_id = @number - 1
        elsif @number > 5
            puts "Please enter a vailid number".red
            sleep (2)
            TopCli.top_menu
        else
            TopCli.top_menu
        end

        @album = Top.all[@trk_id][:album]
        @description = Top.all[@trk_id][:description]
        @title = Top.all[@trk_id][:title]
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
                Menu.main_menu
            elsif choice == 2
                TopCli.top_menu
            elsif choice == 3
                Menu.exit
            else
                puts "Please enter a vailid number".red
                sleep (2)
                TopCli.track_info
            end
                   
    end
end


   

    


       









        



    

