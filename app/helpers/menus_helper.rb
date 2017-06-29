module MenusHelper
  def decorate(menu)
    link_to "#{menu.date.strftime('%A')} (#{menu.date.strftime('%d.%m.%Y')})", menu_meals_path(menu)
  end
end
