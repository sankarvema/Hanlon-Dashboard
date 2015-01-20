require './lib/config.rb'

=begin
buzzwords = ['Paradigm shift', 'Leverage', 'Pivoting', 'Turn-key', 'Streamlininess', 'Exit strategy', 'Synergy', 'Enterprise', 'Web 2.0'] 
buzzword_counts = Hash.new({ value: 0 })
=end

SCHEDULER.every '5s' do
=begin
random_buzzword = buzzwords.sample
  buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }
  
  send_event('configList', { items: buzzword_counts.values })
=end
   q = Names.new "http://hanlon.herokuapp.com/hanlon/api/v1/image"
   current = q.query
   
  #len = current.length 
  #buzzword_counts = Hash.new({ value: 0 })
  buzzword_counts = Hash.new()
  #val = current[0][:name]
  #puts "#{current} len is #{len} and val is #{val}"
  #puts "#{len}"
  #names = Array.new(len)
  #index = Array.new(len) { |i| i=i+1 }


=begin
for i in (0..(len-2))
  	#names[i] = current[i][:name]
 	buzzword_counts[k] = { label: keys[i], value: current[keys[i]]  }
 	k=k+1
  #puts "#{current[i][:name]}"
  end
=end

  #keys = get_Keys(current[:response])
  #len = keys.length

  resp = current[:response]
  resp_len = resp.length
  #puts "#{get_Keys(resp[0])}"

  for i in (0..(resp_len-1))
    keys = get_Keys(resp[i])
    resp[i][:@classname].slice! "ProjectHanlon::ImageService::"
    buzzword_counts[i] = {label: i+1, uuid: resp[i][:@uuid] , classname:  resp[i][:@classname] , uri: resp[i][:@uri]}

    
  end

  

 #random_buzzword = buzzwords.sample
 #puts "#{random_buzzword} #{buzzword_counts[random_buzzword]} #{buzzword_counts.values} "
 send_event('imageList', { items: buzzword_counts.values })

end

