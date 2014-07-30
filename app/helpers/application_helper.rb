module ApplicationHelper
  def desk
    @client ||= DeskApi::Client.new({
      token: 'gT0DSxcvg1OksCledWnq',
      token_secret: 'V1hITFDNMbi4yARZ5mV0OFXw9htu3628eEUVLBAv',
      consumer_key: '0GqJJNW3dt03dsbqWIWr',
      consumer_secret: '1eMmEFvcAv8WISkK2LfFlqZPlNPVxZ9aN23Hbyus',
      subdomain: 'pcconsulting'
    })
  end
end
