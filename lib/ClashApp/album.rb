
class Album

    @@all = []

    def self.all 
        @@all.flatten
    end

    def initialize(album_array)
        @@all << album_array
    end

end
