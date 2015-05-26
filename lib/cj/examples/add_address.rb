require 'anubisnetwork-client'
require 'json'

pp "Testing add address"

pp "acquire session"
user_name="Appcara"
password="B8KZpPG8XotN"
keep_session=true
session = AnubisNetwork::Client.authentication(user_name, password, keep_session)
pp session


