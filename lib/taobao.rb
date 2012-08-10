$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Taobao
  mattr_accessor :app_key
  @@app_key = nil

  mattr_accessor :app_secret
  @@app_secret = nil

  mattr_accessor :rest_endpoint
  @@rest_endpoint = nil

  mattr_accessor :auth_url
  @@auth_url = nil

  mattr_accessor :pid
  @@pid = nil

  def self.setup
    yield self
  end

  autoload :Client, "taobao/client"
  autoload :Model, "taobao/model"
  autoload :ErrorInput, "taobao/models/error_input"
  autoload :TaobaokeItem, "taobao/models/taobaoke_item"
  autoload :TaobaokeShop, "taobao/models/taobaoke_shop"
  autoload :TaobaokeReport, "taobao/models/taobaoke_report"
  autoload :TaobaokeReportMember, "taobao/models/taobaoke_report_member"
  autoload :Trade, "taobao/models/trade"
  autoload :Order, "taobao/models/order"
  autoload :PromotionDetail, "taobao/models/promotion_detail"
  autoload :Item, "taobao/models/item"
  autoload :Task, "taobao/models/task"
  autoload :Subtask, "taobao/models/subtask"
  autoload :Shop, "taobao/models/shop"
end


