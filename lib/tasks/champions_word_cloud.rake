namespace :champions do
  task word_cloud: :environment do |position|
    champions = Statistic.where(tier: 'all', position: position, region: 'global', period: 'month').
      joins(:champion).
      select(:name, :pick_rate).
      map { |w| [w.name, (w.pick_rate * 10**6).to_i] }

    puts "Creating word cloud for position #{position}"
    cloud = MagicCloud::Cloud.new(champions, rotate: :square, scale: :linear)
    image = cloud.draw(960, 600)
    image.write("#{Rails.root.join('app', 'assets', 'images',)}/word_cloud_#{position}.png")
    puts "Done!"
  end
end