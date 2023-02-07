namespace :chatsonic do
  task fetch_champions_tips: :environment do
    uri = "https://api.writesonic.com/v2/business/content/chatsonic?engine=premium"

    headers = {
      'accept' => 'application/json',
      'content-type' => 'application/json',
      'X-API-KEY' => ENV['CHATSONIC_API_KEY']
    }

    body = {
      'enable_google_results' => true,
      'enable_memory' => false,
      'input_text' => ""
    }

    Champion.first(3).each do |champion|
      body['input_text'] = "Summarize the pros and cons of playing #{champion.name} in League of legends. List tips for playing #{champion.name}"
      binding.pry
      data = HTTParty.post(uri, headers:, body: body.to_json, verify: false)
      binding.pry
    end
  end
end
