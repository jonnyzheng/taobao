#
# http://wiki.open.taobao.com/index.php/TaobaokeItem
#

require 'taobao/model'

module Taobao
  class TaobaokeItem < Model
    def self.attr_names
      [
       :click_url,
       :commission,
       :commission_num,
       :commission_rate,
       :commission_volume,
       :iid,
       :nick,
       :pic_url,
       :price,
       :title,
      ]
    end

    for a in attr_names
      attr_accessor a
    end

    class << self
      def convert(id,options)
        options.merge!({:num_iids=> id,
                       :method =>'taobao.taobaoke.items.convert',
                       :pid=>Taobao.pid})
        obj = TaobaokeItem.invoke('get',options)
        item = TaobaokeItem.new
        if(obj["taobaoke_items_convert_response"]["total_results"]>0)
            item.fill_fields(obj['taobaoke_items_convert_response']['taobaoke_items']['taobaoke_item'][0])
        end
        item
      end
    end

  end
end
