require 'digest/md5'
require 'net/http'
require 'open-uri'

module Taobao
  module Client

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def invoke(method,options={})
          params = {
              :app_key   => Taobao.app_key,
              :format    =>'json',
              :v         =>'2.0',
              :timestamp =>Time.now.strftime("%Y-%m-%d %H:%M:%S"),
              :sign_method => 'md5'
          }

          app_secret  = Taobao.app_secret
          end_point = Taobao.rest_endpoint
          params.merge!(options)
          str = app_secret + (params.sort.collect { |c| "#{c[0]}#{c[1]}" }).join("") + app_secret
          params["sign"] = Digest::MD5.hexdigest(str).upcase!
          request(:http_method=>method,:url=>end_point,:params=>params)
      end

      def request(args)
        if args[:http_method] == 'post'
            res = Net::HTTP.post_form(URI.parse(args[:url]),args[:params] )
        elsif args[:http_method] == 'get'
            url = args[:url]+'?'+args[:params].collect{|k,v| URI.escape("#{k}=#{v}")}.join('&')
            p url
            uri =URI.parse(url)
            res = Net::HTTP.get_response(uri)
        end
        obj = JSON.parse(res.body)
        raise ErrorInput, error_message(obj) if obj.include? "error_response"
        obj
      end

      def error_message(obj)
        obj['error_response'].collect{|k,v| "#{k}:#{v}"}.join('  ')
      end
    end
  end
end
