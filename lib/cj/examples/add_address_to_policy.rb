require 'anubisnetwork-client'
require 'json'

pp "Testing add address to policy"

pp "acquire session"
user_name="Appcara"
password="B8KZpPG8XotN"
keep_session=true
session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
pp session

pp "retreive available domains"
domains = AnubisNetwork::Client.list_domains(session)
domain_hash = JSON.parse(domains)

pp "add address to policy"
params = {}
params[:session] = session
params[:target] = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
params[:list_id] = "whitelist"
params[:direction] = "inbound"
params[:entries] = ["abc@amds.com","abcd@amds.com"]
result_add_to_policy = AnubisNetwork::Client.add_address_to_policy_list(params)

pp "add address to policy result: #{result_add_to_policy}"

