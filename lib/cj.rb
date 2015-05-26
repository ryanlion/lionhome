module CJ
  class APIClient 
    @http = "http"
    @https = "https"
    @advertisterhost= "advertiser-lookup.api.cj.com"
    @commissionhost= "commission-detail.api.cj.com"
    @producthost= "product-search.api.cj.com"
    @meilishuo_auth_url= "api.open.meilishuo.com/router/rest"

    def self.advertiser_look_up(args)
        @api = ::CJ::API.new(@https, @advertisterhost)
        @api.advertiser.advertiser_look_up(args)
    end

    def self.commission_details(args)
        @api = ::CJ::API.new(@https, @commissionhost)
        @api.commission.commission_details(args)
    end
    
    def self.product_search(args)
        @api = ::CJ::API.new(@https, @producthost)
        @api.product.product_search(args)
    end
    def self.product_search(args)
        @api = ::CJ::API.new(@http, @meilishuo_auth_url)
        @api.product.product_search(args)
    end
  end
end
# it should not be loaded in all environment
# require 'debugger'
require 'ostruct'
require_relative 'cj/client/client.rb'
