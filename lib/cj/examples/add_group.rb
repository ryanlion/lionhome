require 'anubisnetwork-client'
require 'json'

pp "Testing add domain group"

pp "acquire session"
user_name="Appcara"
password="B8KZpPG8XotN"
keep_session=false
session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
pp "session #{session}"

pp "retrieve time zones"
time_zones = AnubisNetwork::Client.list_time_zones(session)
timezones_hash = JSON.parse(time_zones)
pp "timezone: #{time_zones}"

pp "retrieve domains"
domains = AnubisNetwork::Client.list_domains(session)
domain_hash = JSON.parse(domains)
pp "domains: #{domain_hash}"

pp "retrieve top domain"
top_domain = AnubisNetwork::Client.get_top_domain(session)
top_domain_hash = JSON.parse(top_domain)
pp "top domain: #{top_domain_hash}"

pp "add group"
params={}

params[:session]=session
params[:domain]="adddomaingroup1.com"
params[:domain_type]="GROUP"
params[:parent_domain_id] = top_domain_hash["get_top_domainResponse"]["return"]["header"]["id"]
params[:support_contact]="aaa@abc.com"
params[:time_zone]=timezones_hash["list_time_zonesResponse"]["return"]["time_zones"][0]
result = AnubisNetwork::Client.add_domain_group(params)


pp "add domain group: #{result}"

