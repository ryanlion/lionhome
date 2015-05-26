require 'anubisnetwork-client'
require 'json'

pp "Testing get allowed user roles"

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



pp "start get allowed user roles"
allowed_roles_result = AnubisNetwork::Client.get_allowed_user_roles(session,test_domain)
allowed_roles_result_hash = JSON.parse(allowed_roles_result)

pp "allowed roles result: #{allowed_roles_result_hash}"
