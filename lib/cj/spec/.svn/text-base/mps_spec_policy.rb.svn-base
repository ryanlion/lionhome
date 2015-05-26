require_relative '../lib/anubisnetwork-client.rb'
require_relative '../lib/anubisnetwork/client/client.rb'
require 'json'

describe "Test Policy" do

  describe 'Add Address' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      pp session
      time_zones = AnubisNetwork::Client.list_time_zones(session)
      timezones_hash = JSON.parse(time_zones)

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      top_domain = AnubisNetwork::Client.get_top_domain(session)
      top_domain_hash = JSON.parse(top_domain)

      domain_id = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      use_configuration_limit = true
      addresses = AnubisNetwork::Client.list_addresses(session,domain_id,use_configuration_limit)
      addresses_hash = JSON.parse(addresses)

      params = {}
      params[:session] = session
      params[:domain_id] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      params[:address] = ["abc@amds.com","abcd@amds.com"]
      params[:import_type] = "append"
      result_address = AnubisNetwork::Client.add_address(params)

      params = {}
      params[:session] = session
      params[:target] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      params[:direction] = "inbound"
      params[:list_id] = "whitelist"  #available values: whitelist, blacklist, whitelist_exception, blacklist_exception, rcpt_whitelist, rcpt_blacklist, rcpt_whitelist_exception, rcpt_blacklist_exception, ip_whitelist, ip_blacklist, ip_whitelist_exception, ip_blacklist_exception, host_whitelist, host_blacklist, host_whitelist_exception, host_blacklist_exception
      policy_list  = AnubisNetwork::Client.get_list(params)
      pp policy_list

    end
  end

  describe 'Add Address To Policy' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      pp session

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      top_domain = AnubisNetwork::Client.get_top_domain(session)
      top_domain_hash = JSON.parse(top_domain)

      params = {}
      params[:session] = session
      params[:target] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      params[:list_id] = "whitelist"
      params[:direction] = "inbound"
      params[:entries] = ["abc@amds.com","abcd@amds.com"]
      result_add_to_policy = AnubisNetwork::Client.add_address_to_policy_list(params)

   end
  end

  describe 'Remove Address From Policy' do
    it "success" do
      user_name="Appcara"
      password="B8KZpPG8XotN"
      keep_session=true
      session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
      pp session

      domains = AnubisNetwork::Client.list_domains(session)
      domain_hash = JSON.parse(domains)

      top_domain = AnubisNetwork::Client.get_top_domain(session)
      top_domain_hash = JSON.parse(top_domain)

      params = {}
      params[:session] = session
      params[:target] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      params[:list_id] = "whitelist"
      params[:direction] = "inbound"
      params[:entries] = ["abc@amds.com","abcd@amds.com"]
      result_add_to_policy = AnubisNetwork::Client.add_address_to_policy_list(params)

      params = {}
      params[:session] = session
      params[:target] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      params[:list_id] = "whitelist"
      params[:direction] = "inbound"
      params[:entries] = ["abc@amds.com","abcd@amds.com"]
      result_remove_from_policy = AnubisNetwork::Client.remove_address_from_policy_list(params)

    end
  end

  describe 'Set Blacklist Empty Sender' do
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
      params[:target] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
      params[:direction] = "inbound"
      params[:value] = true
      result_set_blacklist_senders = AnubisNetwork::Client.set_blacklist_empty_senders(params)
      result_get_blacklist_senders = AnubisNetwork::Client.get_blacklist_empty_senders(params)
      result_reset_blacklist_senders = AnubisNetwork::Client.reset_blacklist_empty_senders(params)

    end
  end

   
end
