# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://vuaraug4.com"
SitemapGenerator::Interpreter.send :include, Erp::Vuaraug4::Engine.routes.url_helpers
SitemapGenerator::Interpreter.send :include, Erp::Vuaraug4::ApplicationHelper
SitemapGenerator::Interpreter.send :include, Erp::ApplicationHelper

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # add search_path
  #add blog_path
  add about_us_path
  add contact_us_path
  add all_product_path
  #add brand_listing_path
  # add "dang-ky-nhan-tin.html"

  # product link
  Erp::Products::Product.get_active.each do |product|
    add product_detail_path(product_id: product.id, title: url_friendly(product.product_name))
  end

  # menu link
  Erp::Menus::Menu.get_active.each do |menu|
    add product_listing_path(title: url_friendly(menu.name), menu_id: menu.id)
  end

  # article link
  Erp::Articles::Article.get_active.each do |article|
    #add blog_detail_path(article.id, title:  url_friendly(article.name))
  end

  # brand link
  Erp::Products::Brand.get_active.each do |brand|
    #add brand_detail_path(brand_id: brand.id, title: url_friendly(brand.name))
  end
end
