namespace :riot do
  res = HTTParty.get('http://ddragon.leagueoflegends.com/cdn/12.23.1/data/en_US/champion.json', format: :plain)
  res = JSON.parse(res.body)
  res = res.with_indifferent_access
  res = res['data']
  task fetch_champions: :environment do
    res.each do |name,|
      puts "Seeding data for champion #{name}"
      champ = HTTParty.get("http://ddragon.leagueoflegends.com/cdn/12.23.1/data/en_US/champion/#{name}.json")
      champ_pt_br = HTTParty.get("http://ddragon.leagueoflegends.com/cdn/12.23.1/data/pt_BR/champion/#{name}.json")
      champ_es = HTTParty.get("http://ddragon.leagueoflegends.com/cdn/12.23.1/data/es_MX/champion/#{name}.json")

      data = JSON.parse(champ.body).with_indifferent_access['data'][name]
      data_pt_br = JSON.parse(champ_pt_br.body).with_indifferent_access['data'][name]
      data_es = JSON.parse(champ_es.body).with_indifferent_access['data'][name]
      champion = Champion.create(
        {
          name: data['name'],
          key: data['key'],
          title: data['title'],
          title_pt_br: data_pt_br['title'],
          title_es: data_es['title'],
          blurb: data['blurb'],
          blurb_pt_br: data_pt_br['blurb'],
          blurb_es: data_es['blurb'],
          lore: data['lore'],
          lore_pt_br: data_pt_br['lore'],
          lore_es: data_es['lore'],
          difficulty: data['difficulty'],
          role: data['tags'][0].downcase,
          secondary_role: data['tags'][1]&.downcase,
          enemy_tips: data['enemytips'].join(' '),
          enemy_tips_pt_br: data_pt_br['enemytips'].join(' '),
          enemy_tips_es: data_es['enemytips'].join(' '),
          ally_tips: data['allytips'].join(' '),
          ally_tips_pt_br: data_pt_br['allytips'].join(' '),
          ally_tips_es: data_es['allytips'].join(' '),
          name_identifier: name
        }
      )
      puts "Could not save champion #{name}" unless champion.persisted?
    end
  end
end
