class Top

    @@all = []
   
    def self.all 
        @@all.flatten
    end

    def initialize(top_array)
        @@all << top_array
    end
end
