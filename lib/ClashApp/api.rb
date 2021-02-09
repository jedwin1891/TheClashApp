
    class Api
                  
        URL          = "https://www.theaudiodb.com/api/v1/json/523532/"
        ENDPOINTS    = %W(track search album 111450 track-top10 mvid )
                


        def self.get_endpoint(endpoint)
            new_url = URL + '/.php?i=' + endpoint 
            self.call_api(new_url)

        end

        def self.search_endpoint(endpoint, search_term)
           search_url = URL + endpoint + '.php?i=' + search_term
            self.call_api(search_url)

        end

        def self.call_api(url)
            HTTParty.get(url)
        end

        def self.track_search(search_term)
            search_url = URL + "track" + '.php?m=' + search_term
            self.call_api(search_url)
        end

        def self.top_search(search_term)
            search_url = URL + "track-top10-mb" + '.php?s=' + search_term
            self.call_api(search_url)
        end

        def self.album_search
            "https://theaudiodb.com/api/v1/json/1/album.php?i=111450"
        end

        def self.get_albums
            response = HTTParty.get(album_search)
            @@album_array = response["album"].each do |album|
                Album.new(album)
            end
        end

        def self.get_bio
            response = Api.search_endpoint('artist', '111450')
            @@bio_array = response["artists"].map do |bio|
                     {
                           bio_en: bio["strBiographyEN"],
                           bio_es: bio["strBiographyES"],
                          genre: bio["strGenre"],
                             id: bio["idArtist"]
                     }       
                end
            Bio.new(@@bio_array)
        end

        def self.get_top
            @@top_array = Api.top_search('8f92558c-2baa-4758-8c38-615519e9deda')["track"].map do |track|
                {
                    title: track["strTrack"],
                    album: track["strAlbum"],
                    description: track["strDescriptionEN"],
                    track_id: track["idTrack"]
        
                }
                end
            Top.new(@@top_array)
        end

    end


            


       