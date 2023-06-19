namespace :opgg do
  desc 'TODO'
  task fetch_statistics: :environment do
    ['month', 'week', 'day'].each do |period|
      Statistic.regions.each_key do |region|
        Statistic.positions.each_key do |position|
          Statistic.tiers.each_key do |tier|
            puts "Seeding data for position #{position}, tier #{tier}, period #{period}, region #{region}"
            # binding.pry
            res = HTTParty.get("https://op.gg/api/v1.0/internal/bypass/statistics/#{region}/champions/ranked?period=#{period}&tier=#{tier}&position=#{position}")
            res = res['data']

            champs_keys = res.map { |stat| stat['champion_id'] }
            champs = Champion.where(key: champs_keys).map { |champ| [champ.key, champ] }.to_h

            res = res.map do |statistic|
              next if champs[statistic['champion_id']].nil?
              {
                'champion_id' => champs[statistic['champion_id']].id,
                'period' => period,
                'region' => region,
                'position' => position,
                'tier' => tier,
                'win_rate' => statistic['win'].to_f / statistic['play'],
                'pick_rate' => statistic['pick_rate'].to_f,
                'kill' => statistic['kill'].to_i,
                'death' => statistic['death'].to_i,
                'assist' => statistic['assist'].to_i,
                'champion_key' => statistic['champion_id'],
                'role' => champs[statistic['champion_id']]&.role&.downcase,
                'secondary_role' => champs[statistic['champion_id']]&.secondary_role&.downcase
              }.with_indifferent_access
            end.reject { |e| e.nil? }

            # binding.pry
            # all_data += res
            Statistic.upsert_all(res)

            # res.each do |statistic|
            #   champ = Champion.where(key: statistic['champion_id']).first
            #   statistic = Statistic.create(
            #     {
            #       champion: champ,
            #       period:
            #       region:,
            #       position:,
            #       tier:,
            #       win_rate: statistic['win'].to_f / statistic['play'],
            #       pick_rate: statistic['pick_rate'].to_f,
            #       kill: statistic['kill'].to_i,
            #       death: statistic['death'].to_i,
            #       assist: statistic['assist'].to_i,
            #       champion_key: statistic['champion_id'],
            #       role: champ.role.downcase,
            #       secondary_role: champ.secondary_role&.downcase,
            #     }
            #   )
            #   puts "Could not save statistic for champion #{champ.name}" unless statistic.persisted?
            # end
          end
        end
      end
    end
    # Statistic.upsert_all(all_data)
  end
end
