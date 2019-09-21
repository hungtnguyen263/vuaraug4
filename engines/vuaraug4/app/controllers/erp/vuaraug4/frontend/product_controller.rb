module Erp
  module Vuaraug4
    module Frontend
      class ProductController < Erp::Frontend::FrontendController
        def list
          #@web_info = Erp::Contacts::Contact.get_main_contact
          
          @menus = Erp::Menus::Menu.get_active.where(parent_id: nil)
          
          @products = Erp::Products::Product.get_active
          product_ids = @products.where(is_bestseller: true).order(:created_at).pluck(:id) +
                        @products.where.not(is_bestseller: true).order(:created_at).pluck(:id)
          
          @products = @products.where(id: product_ids)
          
          @products = @products.order(product_ids).paginate(:page => params[:page], :per_page => 20)
        end
        
        def category
          #@web_info = Erp::Contacts::Contact.get_main_contact
          
          @menu = Erp::Menus::Menu.find(params[:menu_id])
          @products = @menu.get_products_for_categories(params).paginate(:page => params[:page], :per_page => @menu.number_per_page)
          @meta_keywords = @menu.meta_keywords
          @meta_description = @menu.meta_description
        end
        
        def detail
          #@web_info = Erp::Contacts::Contact.get_main_contact
          
          @product = Erp::Products::Product.find(params[:product_id])
          @menu = params[:menu_id].present? ? Erp::Menus::Menu.find(params[:menu_id]) : @product.find_menu
          
          @meta_keywords = @product.meta_keywords
          @meta_description = @product.meta_description
          
          if @menu.present?
            if !@product.meta_keywords.present?
              @meta_keywords = @menu.meta_keywords
            end
            
            if !@product.meta_description.present?
              @meta_description = @menu.meta_description
            end
          end
        end
      end
    end
  end
end