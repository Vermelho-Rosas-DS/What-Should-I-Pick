namespace :opgg do
  desc 'TODO'
  task fetch_statistics: :environment do
    Statistic.positions.each_key do |position|
      Statistic.tiers.each_key do |tier|
        puts "Seeding data for #{position}, #{tier}"
        res = HTTParty.get("https://op.gg/api/v1.0/internal/bypass/statistics/global/champions/ranked?period=month&tier=#{tier}&position=#{position}")
        res = res['data']
        res.each do |statistic|
          champ = Champion.where(key: statistic['champion_id']).first
          statistic = Statistic.create(
            {
              champion: champ,
              tier:,
              position:,
              win_rate: statistic['win'].to_f / statistic['play'],
              pick_rate: statistic['pick_rate'].to_f,
              role: champ.role.downcase,
              region: 'global',
              kill: statistic['kill'].to_i,
              death: statistic['death'].to_i,
              assist: statistic['assist'].to_i,
              champion_key: statistic['champion_id'],
              secondary_role: champ.secondary_role&.downcase
            }
          )
          puts "Could not save statistic for champion #{champ.name}" unless statistic.persisted?
        end
      end
    end
  end
end
