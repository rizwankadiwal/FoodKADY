module ApplicationHelper

  #Header Navigation Start

  def find_all_submenu_category(category)
    if !category.children.empty?
      html_code = ''
      category.children.each do |sub_category|
          html_code += '<div class="col-xs-12 col-sm-6 col-md-2 col-menu">'
          html_code += '<ul class="links">'
          html_code += print_submenu_category(sub_category)
          html_code += '</ul></div>'
      end
    end
    html_code += ''
  end

  def print_header_category(category)
    html_code = ''
    html_code += '<li class="dropdown yamm mega-menu">'
    html_code += link_to category.category_name, '#',
        {class: 'dropdown-toggle',
         'data-hover'=> 'dropdown',
         'data-toggle'=>'dropdown'
        }
  end

  def print_submenu_category(category)

    html_code = '<li>'
    html_code += link_to category.category_name, category_path(category: category.id)
    html_code += '</li>'
  end

  def get_categories(categories)
    html_code = ''
    categories.roots.each do |category|
      html_code += print_header_category(category)
      if !category.children.empty?
        html_code += '<ul class="dropdown-menu container">'
        html_code += '<li><div class="yamm-content ">'
        html_code += '<div class="row">'
        html_code += find_all_submenu_category(category)
        html_code += '</div></li></ul>'
      end
      html_code += '</li>'
    end
    html_code.html_safe
  end

  #Header Navigation End

  #Sidebar Navigation Start


  def find_all_sidebar_submenu_category(category)
    if !category.children.empty?
      html_code = ''
      category.children.each do |sub_category|
        html_code += '<div class="col-sm-12 col-md-3">
                  <ul class="links list-unstyled">'
        html_code += print_sidebar_submenu_category(sub_category)
        html_code += '</ul></div>'
      end
    end
    html_code += ''
  end

  def print_sidebar_header_category(category)
    html_code = ''
    html_code += '<li class="dropdown menu-item">'
    html_code += link_to category.category_name, '#', {class: 'dropdown-toggle',
                                                       'data-toggle'=>'dropdown'}
  end

  def print_sidebar_submenu_category(category)

    html_code = '<li>'
    html_code += link_to category.category_name, category_path(category: category.id)
    html_code += '</li>'
  end

  def get_sidebar_categories(categories)
    html_code = ''
    categories.roots.each do |category|
      html_code += print_sidebar_header_category(category)
      if !category.children.empty?
        html_code += '<ul class="dropdown-menu mega-menu">
            <li class="yamm-content">
              <div class="row">'
        html_code += find_all_sidebar_submenu_category(category)
        html_code += '</div></li></ul>'
      end
      html_code += '</li>'
    end
    html_code.html_safe
  end
end
