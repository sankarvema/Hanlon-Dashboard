require './lib/config.rb'



SCHEDULER.every '5s' do

   q = Names.new "http://hanlon.herokuapp.com/hanlon/api/v1/image"
   current = q.query
   
  
  buzzword_counts = Hash.new()
  




  

  resp = current[:response]
  resp_len = resp.length
  
  for i in (0..(resp_len-1))
    #keys = get_Keys(resp[i])
    resp[i][:@classname].slice! "ProjectHanlon::ImageService::"
    buzzword_counts[i] = { 
                            label: i+1, 
                            uuid: resp[i][:@uuid] ,
                            uuids: resp[i][:@uuid][0,6] ,
                            classname:  resp[i][:@classname] , 
                            uri: resp[i][:@uri],
                            bindcounter: "1234",
                            noun: resp[i][:@noun]
                          }

    
  end

 send_event('imageList', { items: buzzword_counts.values })

end

