Erp::Articles::Category.class_eval do
  # get alias
  def self.get_alias_options()
    [
      {text: I18n.t('blog'),value: self::ALIAS_BLOG},
      {text: I18n.t('about_us'),value: self::ALIAS_ABOUT_US},
      {text: I18n.t('home_about'),value: self::ALIAS_HOME_ABOUT}
    ]
  end
end