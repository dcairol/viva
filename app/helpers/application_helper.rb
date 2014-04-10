module ApplicationHelper

  def default_blank
  	{include_blank: '---'}
  end

  def si_o_no valor
  	valor ? 'Sí' : 'No'
  end

end
