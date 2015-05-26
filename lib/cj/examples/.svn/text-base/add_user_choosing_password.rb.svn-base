require 'anubisnetwork-client'
require 'json'

pp "Testing add user choosing password"

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
pp "domains: #{domain_hash}"

pp "start add user choosing password"
params = {}
params[:session] = session
params[:new_user_pass] = "abcd1234"
params[:parent_domain_id] = test_domain
params[:mps_id] = ""
params[:real_name] = "real name"
params[:role_name] = "help desk"
params[:user_name] = "test3456"
result_add_user_c_pass = AnubisNetwork::Client.add_user_choosing_password(params)
add_user_c_result_hash = JSON.parse(result_add_user_c_pass)
pp "add user choosing password result: #{add_user_c_result_hash}"

