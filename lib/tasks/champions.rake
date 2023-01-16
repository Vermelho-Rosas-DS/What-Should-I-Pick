namespace :champions do
  res = HTTParty.get('http://ddragon.leagueoflegends.com/cdn/12.23.1/data/en_US/champion.json', format: :plain)
  res = JSON.parse(res.body)
  res = res.with_indifferent_access
  res = res['data']
  desc 'TODO'
  task champions_task: :environment do
    res.each do |name,|
      puts "Seeding data for champion #{name}"
      champ = HTTParty.get("http://ddragon.leagueoflegends.com/cdn/12.23.1/data/en_US/champion/#{name}.json")
      data = JSON.parse(champ.body)
      data = data.with_indifferent_access
      data = data['data']
      data = data[name]
      champion = Champion.create(
        {
          name: data['name'],
          key: data['key'],
          title: data['title'],
          blurb: data['blurb'],
          lore: data['lore'],
          difficulty: data['difficulty'],
          role: data['tags'][0].downcase,
          secondary_role: data['tags'][1]&.downcase,
          enemy_tips: data['enemytips'].join(' '),
          ally_tips: data['allytips'].join(' ')
        }
      )
      puts "Could not save champion #{name}" unless champion.persisted?
    end
  end
end
