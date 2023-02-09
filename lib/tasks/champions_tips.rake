namespace :chatsonic do
  task fetch_champions_tips: :environment do
    uri = 'https://api.writesonic.com/v2/business/content/chatsonic?engine=premium'

    headers = {
      'accept' => 'application/json',
      'content-type' => 'application/json',
      'X-API-KEY' => ENV.fetch('CHATSONIC_API_KEY', nil)
    }

    body = {
      'enable_google_results' => true,
      'enable_memory' => false,
      'input_text' => ''
    }

    Champion.find_each do |champion|
      next if champion.ai_tips.present?

      puts "Fetching data for #{champion.name}"

      body['input_text'] = "Summarize the pros and cons of playing #{champion.name} in League of legends. List tips for playing #{champion.name}"
      data = HTTParty.post(uri, headers:, body: body.to_json, verify: false)
      response_code = data.response.code.to_i

      if response_code >= 200 && response_code < 300
        champion.ai_tips = data['message']
        puts "Success: #{data['message']}"
      else
        puts "Got an error for #{champion.name}. Code: #{response_code}. Message: #{data['message']}"
      end

      puts "Could not save data on #{champion.name}" unless champion.save
    end
  end
end
