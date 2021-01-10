
    class Api

        URL          = 'https://www.theaudiodb.com/api/v1/json/523532/'
        ENDPOINTS    = %W(track search album 111450 track-top10 mvid)
        


        def self.get_endpoint(endpoint)
            new_url = URL + '.php?i=' + endpoint 
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



      


    end


       