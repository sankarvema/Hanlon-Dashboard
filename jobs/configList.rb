require './lib/config.rb'



SCHEDULER.every '5s' do

   k = 0;
   q = Names.new "http://hanlon.herokuapp.com/hanlon/api/v1/config"
   current = q.query
   keys = get_Keys(current)
   len = keys.length
   
 
  buzzword_counts = Hash.new()
  

for i in (0..(len-2))
  	
 	buzzword_counts[k] = { label: keys[i], value: current[keys[i]]  }
 	k=k+1
 	
  end

  keys = get_Keys(current[:response])
  len = keys.length

  for i in (0..(len-1))
 
 	buzzword_counts[k] = { label: keys[i], value: current[:response][keys[i]]  }
 	k=k+1
 	
  end


 
 send_event('configList', { items: buzzword_counts.values })

end

def get_Keys(h)
  keys = []
  return keys if h.empty?
  h.each {|k,v| keys << k; }  
  keys
end
