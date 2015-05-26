require 'anubisnetwork-client'
require 'json'

pp "Testing set user setting"

pp "acquire session"
user_name="Appcara"
password="B8KZpPG8XotN"
keep_session=false
session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
pp "session #{session}"

pp "retrieve domains"
domains = AnubisNetwork::Client.list_domains(session)
domain_hash = JSON.parse(domains)
test_domain = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]
test_domain_name = domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["name"]
pp "domains: #{domain_hash}"

pp "retreive user form domain"
users_from_domain = AnubisNetwork::Client.list_users_from_domain(session,test_domain,true)
users_from_domain_hash = JSON.parse(users_from_domain)

test_user_name = users_from_domain_hash["list_users_from_domainResponse"]["return"]["user_headers"].last["user_name"]
test_mps_id = users_from_domain_hash["list_users_from_domainResponse"]["return"]["user_headers"].last["mps_id"]

pp "list users from domain result #{users_from_domain_hash}"

pp "get user settings"
user_settings = AnubisNetwork::Client.get_user_settings(session,test_user_name)
user_settings_hash = JSON.parse(user_settings)

pp "get user settings result: #{user_settings_hash}"


