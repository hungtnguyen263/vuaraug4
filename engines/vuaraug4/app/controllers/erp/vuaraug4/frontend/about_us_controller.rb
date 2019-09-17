module Erp
  module Vuaraug4
    module Frontend
      class AboutUsController < Erp::Frontend::FrontendController
        def index
          #@web_info = Erp::Contacts::Contact.get_main_contact
          @about = Erp::Articles::Article.get_all_abouts.last
          @meta_keywords = @about.meta_keywords if @about.present?
          @meta_description = @about.meta_description if @about.present?
        end
      end
    end
  end
end