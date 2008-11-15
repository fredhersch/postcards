module PostcardsHelper
  
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
  
  def related_posts(p)
    return Postcard.find_tagged_with(p.tag_list)
  end
    
end
