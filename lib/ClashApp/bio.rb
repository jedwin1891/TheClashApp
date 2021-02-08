class Bio
    @@all = []

    def self.all 
        @@all.flatten
    end

    def initialize(bio_array)
        @@all << bio_array
    end
end
