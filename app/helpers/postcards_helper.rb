module PostcardsHelper
  
  @approved = '1'
  
  def year_select(f)
    f.collection_select(:year, YEARS_SELECT_COLLECTION, :label, :value )
  end
  
  def country_options_for_select(selected = nil, priority_countries = nil)
    country_options = ""
    if priority_countries
      country_options += options_for_select(priority_countries, selected)
      country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
    end
    return country_options + options_for_select(COUNTRIES, selected)
  end
    
  #def popular_postcards
  #  return @postcards = Postcard.find(:all, :order => 'id DESC', :conditions => 'approved = 1, votes_count >= 1')
  #  return @postcards = Postcard.find(:all, :order => 'id DESC', :conditions => ['approved = ?', @approved], :limit => 1)
  #end
  
  def latest_postcards
    #return @postcards = Postcard.find(:all, :order => 'id DESC', :conditions => 'approved = 1', :limit => 5, :offset => 1)
    return @postcards = Postcard.find(:all, :order => 'id DESC', :conditions => ['approved = ?', @approved], :limit => 5, :offset => 1)
    
  end

  def related_posts(p)
    return Postcard.find_tagged_with(p.tag_list, :conditions => 'approved = 1')
  end
    
end
