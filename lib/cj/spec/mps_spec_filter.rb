require_relative '../lib/anubisnetwork-client.rb'
require_relative '../lib/anubisnetwork/client/client.rb'
require 'json'

describe "Test Filter" do

  describe 'Get Filter Rules' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      pp session

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      params = {}
      params[:session] = session
      params[:target_id] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      params[:direction] = "inbound"
      params[:filter_name] = ""
      result_address = AnubisNetwork::Client.get_filter_rules(params)

    end
  end

  
end
