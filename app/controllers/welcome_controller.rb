class WelcomeController < ApplicationController
  def index
    client = DeskApi::Client.new({
      token: 'cF5C9Fuv3DlGU5g1rB8P',
      token_secret: 'UXH0fuSpi1idCqISrP4QVE6nvuwC4sCdGOPnDwWD',
      consumer_key: 'wYGw0UEkmbHFLtFgCWmU',
      consumer_secret: 'egJdds0TvXssfWKHe9MUVNIFvxIgo16rPLXoJECL',
      subdomain: 'pcconsulting'
      })

    # client = DeskApi::Client.new username: 'petertcormack@gmail.com', password: 'N0t0uchy', subdomain: 'pcconsulting'

    @cases = client.cases
    @toshow = ["show", "something", "on", "the", "page"]
  end
end
