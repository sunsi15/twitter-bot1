

require 'twitter'
require 'twitter' #gem install twitter

      # Create a read write application from : 
      # https://apps.twitter.com
      # authenticate it for your account
      # fill in the following
        client = Twitter::REST::Client.new do |config|
            config.consumer_key         = "4Mz0SwXT0nTTYiOZtcQsHHvDS"
            config.consumer_secret      = "JmBqWoDCuhSTrwUnYGFCYudHyP4yfsRdEMwv5Dt0QeY28V0YRv"
            config.access_token         = "4758866355-SPGIBF0w4h78FGTNRQUlplMpWYFA5yrNCD5YfdR"
            config.access_token_secret  = "a3aaJCa1EsmLw501zriklDpe5V8s1n30XYHlSlV4Tg1j8"

end
promotion = {
		"photo" => "promo.jpg",
  		"text" => "Code réduction Clarins : -20% pour un produit acheté et -25% dès 2 produits achetés ! Jetez vous dessus avec le code FETES2017 depuis le site ! #clarins #promo #blackfriday
http://www.clarins.fr/offres/specialoffers/"
  	}


client.search("#beauteprivee").take(10).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
      users = []
      users.push(tweet.user.id)
      puts tweet
      client.follow(users)
  		client.favorite(tweet)
  		client.update_with_media("@#{tweet.user.screen_name} " + promotion["text"], open(promotion["photo"]), {})

end
end