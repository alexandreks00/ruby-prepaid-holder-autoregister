class HeaderSensedia
    def header_sensedia(access_token)
        @headers = {
        'access_token' => access_token, 
        'client_id' => $client_id,
        'Content-Type'  => 'application/json'
        }
    end  
end