module GameHelper

  def losing_role?(params)
    (params[:die_roll] && (params[:balance].to_i == 0))
  end

  def winning_role?(params)
    (params[:die_roll] && (params[:balance].to_i > 0))
  end

end
