require './lib/config.rb'



SCHEDULER.every '5s' do

   q = Names.new "http://hanlon.herokuapp.com/hanlon/api/v1/node"
   current = q.query
   
 
  buzzword_counts = Hash.new()
  

  resp = current[:response]
  resp_len = resp.length
  

  for i in (0..(resp_len-1))
    resp[i][:@classname].slice! "ProjectHanlon::"
    buzzword_counts[i] = {
                            label: i+1, 
                            uuid: resp[i][:@uuid] , 
                            classname:  resp[i][:@classname] , 
                            uri: resp[i][:@uri]
                          }
    
    
    
  end

  

 
 send_event('nodesList', { items: buzzword_counts.values })

end

