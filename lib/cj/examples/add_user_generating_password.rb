require 'anubisnetwork-client'
require 'json'

pp "Testing add user generating password"

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

pp "start add user generating password"
params = {}
params[:session] = session
params[:associated_email] = "cheng.shi@appcara.com"
params[:parent_domain_id] = test_domain
params[:mps_id] = ""
params[:real_name] = "real name"
params[:role_name] = "help desk"
params[:user_name] = "test234"
result_add_user_g_pass = AnubisNetwork::Client.add_user_generating_password(params)
add_user_g_result_hash = JSON.parse(result_add_user_g_pass)
pp "add user generating password result: #{add_user_g_result_hash}"



