module Erp
  module Vuaraug4
    module Frontend
      class HomeController < Erp::Frontend::FrontendController
        def index
          #@web_info = Erp::Contacts::Contact.get_main_contact
          
          @sliders = Erp::Banners::Banner.get_home_sliders.order('erp_banners_banners.custom_order asc')
          @bestseller_products = Erp::Products::Product.get_bestseller_products
        end
      end
    end
  end
end