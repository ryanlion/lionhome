require 'anubisnetwork-client'
require 'json'

pp "Testing change password"

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


pp "start change password"

params = {}
params[:session] = session
params[:user_name] = test_user_name
params[:invoker_password] = "B8KZpPG8XotN"
params[:new_password] = "pass1234"
params[:new_password_confirm] = "pass1234"
change_pw_result = AnubisNetwork::Client.change_password(params)
change_pw_result_hash = JSON.parse(change_pw_result)
pp "change password result: #{change_pw_result_hash}"



