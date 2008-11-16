module PasswordsHelper

  def add_link(name)
    link_to_function name do |page| 
		  page.insert_html :bottom, :links, :partial => 'link', :object => Link.new 
	  end
	end
  
end
