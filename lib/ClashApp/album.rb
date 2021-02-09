
class Album
attr_accessor :id, :year, :name, :tracklist

    @@all = []

    def self.all 
        @@all
    end

    def initialize(album)
        self.id = album["idAlbum"]
        self.year = album["intYearReleased"]
        self.name = album["strAlbum"]
        getsongs
        self.tracklist 
        @@all << self
    end

    def getsongs
        if @tracklist
            return @tracklist
        else 
            alb_details = Api.track_search(id)
            
            @tracklist= alb_details["track"].map do |track|
                {
                    title: track["strTrack"],
                    album: track["strAlbum"]

                }

             end
            end
        end
        

          
     end

