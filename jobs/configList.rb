require './lib/config.rb'


SCHEDULER.every '5s' do

   #k = 0;
   q = Names.new "http://hanlon.herokuapp.com/hanlon/api/v1/config"
   current = q.query
   #keys = get_Keys(current)
   #len = keys.length
   
  
  buzzword_counts = Hash.new()
  
  buzzword_counts[0] = { label: "DB_NAME", value: current[:response][:@persist_dbname]  }
  buzzword_counts[1] = { label: "DB_host", value: current[:response][:@persist_host]  }
  buzzword_counts[2] = { label: "DB_port", value: current[:response][:@persist_port]  }
  buzzword_counts[3] = { label: "DB_mode", value: current[:response][:@persist_mode]  }
  buzzword_counts[4] = { label: "DB_Last_SCAN", value: "1234"  }
    
  #puts buzzword_counts
  
  
  

 send_event('configList', { items: buzzword_counts.values })

end

