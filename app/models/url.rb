class Url < ApplicationRecord

  def self.get_short_url url, custom_alias
    domain_url = URI.parse(url).host
    chars      = [ '0'..'9', 'A'..'Z', 'a'..'z' ].map{ |r| r.to_a }.flatten
    hidden_url = 10.times.map{ chars.sample }.join
    short_url  = !custom_alias.present? ? "#{domain_url}/#{hidden_url}" : "#{domain_url}/#{custom_alias}"
    short_url
  end

  def self.save_url original_url, short_url
    date_expiration = 2.hours.since
    url             = Url.new(original_url: original_url, short_url: short_url, date_expiration: date_expiration)
    url.save ? true : false
  end
end
