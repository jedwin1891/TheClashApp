# module ClashApp
    class Api

        URL          = 'https://www.theaudiodb.com/api/v1/json/523532/'
        ENDPOINTS    = %W(track search album 111450)
        # search_query = '.php?i='


        def self.get_endpoint(endpoint)
            # TODO Create class method to send request to endpoint 
            # endpoint ==> "Bio"
            #create url that has endpoint
            new_url = URL + '.php?i=' + endpoint 
            self.call_api(new_url)

        end

        def self.search_endpoint(endpoint, search_term)
            # TODO use search term and endpoint
           search_url = URL + endpoint + '.php?i=' + search_term
        #    binding.pry
            self.call_api(search_url)

        end

        def self.call_api(url)
            # TODO use HTTParty to call api as a string
            HTTParty.get(url)
        end

        def self.track_search(search_term)
            search_url = URL + "track" + '.php?m=' + search_term
            self.call_api(search_url)
        end


      


    end
# end

       