namespace :champions do
  res = HTTParty.get('http://ddragon.leagueoflegends.com/cdn/12.23.1/data/en_US/champion.json', format: :plain)
  res = JSON.parse(res.body)
  res = res.with_indifferent_access
  res = res['data']
  desc 'TODO'
  task champions_task: :environment do
    res.each do |name,|
      champ = HTTParty.get("http://ddragon.leagueoflegends.com/cdn/12.23.1/data/en_US/champion/#{name}.json") 
      data = JSON.parse(champ.body)
      data = data.with_indifferent_access
      data = data['data']
      data = data[name]
      champ = Champion.create(
        {
          name: data['name'],
          key: data['key'],
          title: data['title'],
          blurb: data['blurb'],
          lore: data['lore'],
          difficulty: data['difficulty'],
          role: data['tags'][0],
          secondary_role: data['tags'][1],
          enemy_tips: data['enemytips'].join(' '),
          ally_tips: data['allytips'].join(' ')
        }
      )
    end
  end
end
