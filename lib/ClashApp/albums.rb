class Albums 
   
    attr_accessor :id, :year, :name

    @@all = []
    
    def initialize(album)
        self.id = album["idAlbum"]
        self.year = album["idAlbum"]
        self.name = album["intYearReleased"]
        @@all << self
    end

    def self.all
        @@all
    end


end
