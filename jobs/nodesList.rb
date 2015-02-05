require './lib/config.rb'



SCHEDULER.every '25s' do

   q = Names.new "http://hanlon.herokuapp.com/hanlon/api/v1/node"
   current = q.query
   
 
  buzzword_counts = Hash.new()
  

  resp = current[:response]
  resp_len = resp.length
  
  i=0;
  for i in (0..(resp_len-1))
    resp[i][:@classname].slice! "ProjectHanlon::"
    buzzword_counts[i] = {
                            
                            uuid: resp[i][:@uuid] , 
                            classname:  resp[i][:@classname] , 
                            uri: resp[i][:@uri],
                            uuids: resp[i][:@uuid][0,6],
                            noun: resp[i][:@noun],
                            cit: "1234",
                            din: "nodelistnum#{i}"


                          }
    
    
    
  end

  

 
 send_event('nodesList', { items: buzzword_counts.values })
 send_event('textCount', {alive: i+1, total: 144})
end

