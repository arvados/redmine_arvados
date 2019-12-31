

class ArvadosHookListener < Redmine::Hook::ViewListener

	render_on :view_layouts_base_body_bottom, :partial => "arvados/footer" 

  #def view_layouts_base_body_bottom(context={} 
  #  return content_tag("p", "Custom content added to the left")
  #end
end

