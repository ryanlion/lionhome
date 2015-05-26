require_relative '../lib/cj.rb'
require_relative '../lib/cj/client/client.rb'
require 'json'

describe lionhome do

  describe 'Add group' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      #session="d5651dfe-2377-418c-a637-3938f7f4516f"
      time_zones = AnubisNetwork::Client.list_time_zones(session)
      timezones_hash = JSON.parse(time_zones)

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      top_domain = AnubisNetwork::Client.get_top_domain(session)
      top_domain_hash = JSON.parse(top_domain)

      params={}

      params[:session]=session
      params[:domain]="adddomaingroup1.com"
      params[:domain_type]="GROUP"
      params[:parent_domain_id] = top_domain_hash["get_top_domainResponse"]["return"]["header"]["id"]
      params[:support_contact]="aaa@abc.com"
      params[:time_zone]=timezones_hash["list_time_zonesResponse"]["return"]["time_zones"][0]
      result = AnubisNetwork::Client.add_domain_group(params)

    end
  end

  describe 'Add domain' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      #session="d5651dfe-2377-418c-a637-3938f7f4516f"
      time_zones = AnubisNetwork::Client.list_time_zones(session)
      timezones_hash = JSON.parse(time_zones)

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      top_domain = AnubisNetwork::Client.get_top_domain(session)
      top_domain_hash = JSON.parse(top_domain)

      params={}

      params[:session]=session
      params[:allow_subdomains]=true
      params[:domain]="adddomain1.com"
      params[:parent_domain_id] = top_domain_hash["get_top_domainResponse"]["return"]["header"]["id"]
      params[:support_contact]="aaa@abc.com"
      params[:time_zone]=timezones_hash["list_time_zonesResponse"]["return"]["time_zones"][0]
      result = AnubisNetwork::Client.add_domain(params)

      pp result
    end
  end

  describe 'delete domain' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      #session="d5651dfe-2377-418c-a637-3938f7f4516f"

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      get_domain_result = AnubisNetwork::Client.get_domain(session,"260b442f-e594-4457-9f14-2f187d4449b8")
    end
  end

  describe 'delete domain' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      #session="d5651dfe-2377-418c-a637-3938f7f4516f"

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      #result = AnubisNetwork::Client.delete_domain(session,domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"])

      #result_hash = JSON.parse(result)
      #result_hash["delete_domainResponse"]["return"]["status_code"].should == 1000
    end
  end

  describe 'activate domain' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      #session="d5651dfe-2377-418c-a637-3938f7f4516f"

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      result = AnubisNetwork::Client.activate_domain(session,domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"],false)

      result_hash = JSON.parse(result)
      result_hash["activate_domainResponse"]["return"]["status_code"].should == 1000

    end
  end

  describe 'logout' do
    it "should successfully logout" do
      result = AnubisNetwork::Client.logout
    end
  end

  describe 'AnubisNetwork domain group' do
    it "should add domain group" do
    end

  end

  
end
