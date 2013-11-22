module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
      
    when /^the new article page$/
      '/admin/content/new'
      
    when /^the view page for "(.*)"/
      "/admin/content/edit/#{Article.find_by_title($1).id}"
      
    #when /^the logout link/
    #  "Log out »" #Brittle

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
