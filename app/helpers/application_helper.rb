module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Проект', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_helper
    flash.collect do |key, message|
    content_tag :p, message, class: "flash #{key}"
    end.join.html_safe
  end
  
end
 
 
