require './lib/config.rb'



SCHEDULER.every '5s' do

   k=0;
   q = Names.new "http://hanlon.herokuapp.com/hanlon/api/v1/node"
   current = q.query
   keys = get_Keys(current)
   len = keys.length
   
 
  buzzword_counts = Hash.new()
  


  resp = current[:response]
  resp_len = resp.length
  

  for i in (0..(resp_len-1))
    keys = get_Keys(resp[i])
    buzzword_counts[k] = {label: i+1, uuid: resp[i][keys[1]] , classname:  resp[i][keys[2]] , uri: resp[i][keys[3]]}
    k=k+1
    
    
  end

  


 send_event('nodesList', { items: buzzword_counts.values })

end

def get_Keys(h)
  keys = []
  return keys if h.empty?
  h.each {|k,v| keys << k; }  
  keys
end
