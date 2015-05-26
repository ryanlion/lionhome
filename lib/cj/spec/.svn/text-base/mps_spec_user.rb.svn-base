require_relative '../lib/anubisnetwork-client.rb'
require_relative '../lib/anubisnetwork/client/client.rb'
require 'json'

describe "Test User APIs" do

  before(:all) do
    @user_name="Appcara"
    @password="B8KZpPG8XotN"
    @keep_session=true
    @session = AnubisNetwork::Client.authentication(@user_name, @password, @keep_session)
    pp @session

    top_domain = AnubisNetwork::Client.get_top_domain(@session)
    top_domain_hash = JSON.parse(top_domain)
    @top_domain_id = top_domain_hash["get_top_domainResponse"]["return"]["header"]["id"]

    domains = AnubisNetwork::Client.list_domains(@session)
    domain_hash = JSON.parse(domains)
    @test_domain =  domain_hash["list_domainsResponse"]["return"]["domain_headers"].last["id"]

    users_from_domain = AnubisNetwork::Client.list_users_from_domain(@session,@top_domain_id,true)
    users_from_domain_hash = JSON.parse(users_from_domain)

    @test_user_name = users_from_domain_hash["list_users_from_domainResponse"]["return"]["user_headers"].last["user_name"]
    @test_mps_id = users_from_domain_hash["list_users_from_domainResponse"]["return"]["user_headers"].last["mps_id"]

    pp "list users from domain result #{users_from_domain_hash}"
  end

  describe 'List user' do
    it "should return a parsable josn" do
      users = AnubisNetwork::Client.list_users(@session)
      users_hash = JSON.parse(users)
      pp "users result: #{users_hash}"
      expect(users_hash).to be_kind_of(Hash)
    end
  end

  describe 'List admins' do
    it "should return a parsable josn" do
      admins = AnubisNetwork::Client.list_admins(@session)
      admins_hash = JSON.parse(admins)

      pp "list admins result #{admins_hash}"
      expect(admins_hash).to be_kind_of(Hash)
    end
  end

  describe 'List admins execpt ou' do
    it "should return a parsable josn" do
      admins_eou = AnubisNetwork::Client.list_admins_except_ou(@session)
      admins_eou_hash = JSON.parse(admins_eou)

      pp "list admins except ou result #{admins_eou_hash}"
      expect(admins_eou_hash).to be_kind_of(Hash)
    end
  end

  describe 'List admins from scope' do
    it "should return a parsable josn" do
      admins_from_scope = AnubisNetwork::Client.list_admins_from_scope(@session,@test_domain)
      admins_from_scope_hash = JSON.parse(admins_from_scope)

      pp "list admins from scope result #{admins_from_scope_hash}"
      expect(admins_from_scope_hash).to be_kind_of(Hash)
    end
  end

  describe 'List users from domain' do
    it "should return a parsable josn" do
      users_from_domain = AnubisNetwork::Client.list_users_from_domain(@session,@top_domain_id,true)
      users_from_domain_hash = JSON.parse(users_from_domain)

      pp "list users from domain result #{users_from_domain_hash}"
      expect(users_from_domain_hash).to be_kind_of(Hash)
    end
  end

  describe 'get user settings' do
    it "should return a parsable josn" do
      user_settings = AnubisNetwork::Client.get_user_settings(@session,@test_user_name)
      user_settings_hash = JSON.parse(user_settings)

      pp "get user settings result: #{user_settings_hash}"
      expect(user_settings_hash).to be_kind_of(Hash)
    end
  end

  describe 'get user external settings' do
    it "should return a parsable josn" do
      external_user_settings = AnubisNetwork::Client.get_user_settings(@session,@test_user_name)
      external_user_settings_hash = JSON.parse(external_user_settings)

      pp "get external user settings result: #{external_user_settings_hash}"
      expect(external_user_settings_hash).to be_kind_of(Hash)
    end
  end

  describe 'validate user target' do
    it "should return a parsable josn" do
      validate_user_result = AnubisNetwork::Client.validate_user_target(@session,@top_domain_id,@test_user_name+'@amds.com')
      validate_user_result_hash = JSON.parse(validate_user_result)

      pp "validate user result: #{validate_user_result_hash}"
      expect(validate_user_result_hash).to be_kind_of(Hash)
    end
  end

  describe 'get user type' do
    it "should return a parsable josn" do
      user_type_result = AnubisNetwork::Client.get_user_type(@session)
      user_type_result_hash = JSON.parse(user_type_result)

      pp "user type result: #{user_type_result_hash}"
      expect(user_type_result_hash).to be_kind_of(Hash)
    end
  end

  describe 'get allowed user roles' do
    it "should return a parsable josn" do
      allowed_roles_result = AnubisNetwork::Client.get_allowed_user_roles(@session,@test_domain)
      allowed_roles_result_hash = JSON.parse(allowed_roles_result)

      pp "allowed roles result: #{allowed_roles_result_hash}"
      expect(allowed_roles_result_hash).to be_kind_of(Hash)
    end
  end

  describe 'add user choosing password' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:new_user_pass] = "abcd1234"
      params[:parent_domain_id] = @test_domain
      params[:mps_id] = ""
      params[:real_name] = "real name"
      params[:role_name] = "help desk"
      params[:user_name] = "test123"
      result_add_user_c_pass = AnubisNetwork::Client.add_user_choosing_password(params)
      add_user_c_result_hash = JSON.parse(result_add_user_c_pass)
      pp "add user choosing password result: #{add_user_c_result_hash}"
      expect(add_user_c_result_hash).to be_kind_of(Hash)
    end
  end
      
  describe 'add user generating password' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:associated_email] = "cheng.shi@appcara.com"
      params[:parent_domain_id] = @test_domain
      params[:mps_id] = ""
      params[:real_name] = "real name"
      params[:role_name] = "help desk"
      params[:user_name] = "test234"
      result_add_user_g_pass = AnubisNetwork::Client.add_user_generating_password(params)
      add_user_g_result_hash = JSON.parse(result_add_user_g_pass)
      pp "add user generating password result: #{add_user_g_result_hash}"
      expect(add_user_g_result_hash).to be_kind_of(Hash)
    end
  end

  describe 'set user settings' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:password_disabled] = false
      params[:mps_id] = @test_mps_id
      params[:real_name] = "real name"
      params[:role_name] = "help desk"
      params[:user_name] = "test234"
      result_set_user_settings = AnubisNetwork::Client.set_user_settings(params)
      result_set_user_settings_hash = JSON.parse(result_set_user_settings)
      pp "set user settings result: #{result_set_user_settings_hash}"
      expect(result_set_user_settings_hash).to be_kind_of(Hash)
    end
  end

  describe 'set user external settings' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:password_disabled] = false
      params[:mps_id] = @test_mps_id
      params[:remote_user_id] = ""
      result_ex_settings = AnubisNetwork::Client.set_user_external_settings(params)
      result_set_user_settings_external_hash = JSON.parse(result_ex_settings)
      pp "set user external settings result: #{result_set_user_settings_external_hash}"
      expect(result_set_user_settings_external_hash).to be_kind_of(Hash)
    end
  end

  describe 'recover password' do
    it "should return a parsable josn" do
      recover_pw_result = AnubisNetwork::Client.recover_user_password(@session,"test123")
      recover_pw_result_hash = JSON.parse(recover_pw_result)

      pp "recover password result: #{recover_pw_result_hash}"
      expect(recover_pw_result_hash).to be_kind_of(Hash)
    end
  end


  describe 'change password' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:user_name] = "test234"
      params[:invoker_password] = @password
      params[:new_password] = "pass1234"
      params[:new_password_confirm] = "pass1234"
      change_pw_result = AnubisNetwork::Client.change_password(params)
      change_pw_result_hash = JSON.parse(change_pw_result)
      pp "change password result: #{change_pw_result_hash}"
      expect(change_pw_result_hash).to be_kind_of(Hash)
    end
  end

  describe 'generate and send password' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:user_name] = "test234"
      params[:invoker_password] = "B8KZpPG8XotN"
      params[:associated_email] = "cheng.shi@appcara.com"
      g_a_s_ps_result = AnubisNetwork::Client.generate_and_send_user_password(params)
      g_a_s_ps_result_hash = JSON.parse(g_a_s_ps_result)
      pp "generate and send password result: #{g_a_s_ps_result_hash}"
      expect(g_a_s_ps_result_hash).to be_kind_of(Hash)
    end
  end

  describe 'delete user' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:users] = ["test234"]
      delete_user_result = AnubisNetwork::Client.delete_user(params)
      delete_user_result_hash = JSON.parse(delete_user_result)
      pp "delete user result: #{delete_user_result_hash}"
      expect(delete_user_result_hash).to be_kind_of(Hash)
    end
  end


  describe 'list other users' do
    it "should return a parsable josn" do
      params = {}
      params[:session] = @session
      params[:domain_id] = @test_domain
      params[:recursive_domains] = true
      list_other_users_result = AnubisNetwork::Client.list_other_users(params)
      list_other_users_result_hash = JSON.parse(list_other_users_result)

      pp "list other users result: #{list_other_users_result_hash}"
      expect(list_other_users_result_hash).to be_kind_of(Hash)
    end
  end

  describe 'is user demoted' do
    it "should return a parsable josn" do
      is_user_demoted_result = AnubisNetwork::Client.is_user_demoted(@session,"test123")
      is_user_demoted_result_hash = JSON.parse(is_user_demoted_result)

      pp "is user demoted result: #{is_user_demoted_result_hash}"
      expect(is_user_demoted_result_hash).to be_kind_of(Hash)
    end
  end


  describe 'demote user' do
    it "should return a parsable josn" do
      demote_user_result = AnubisNetwork::Client.demote_user(@session,"test123")
      demote_user_result_hash = JSON.parse(demote_user_result)

      pp "demote user result: #{demote_user_result_hash}"
      expect(demote_user_result_hash).to be_kind_of(Hash)
    end
  end


  describe 'promote user' do
    it "should return a parsable josn" do
      promote_user_result = AnubisNetwork::Client.promote_user(@session,"test123")
      promote_user_result_hash = JSON.parse(promote_user_result)

      pp "promote user result: #{promote_user_result_hash}"
      expect(promote_user_result_hash).to be_kind_of(Hash)

    end
  end

  
end
