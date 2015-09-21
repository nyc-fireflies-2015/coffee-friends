module CafeSessionsHelper
  def log_in_cafe(cafe)
    session[:cafe_id] = cafe.id
  end

  def current_cafe
    @current_cafe ||= Cafe.find_by(id: session[:cafe_id])
  end

  def cafe_logged_in?
    !current_cafe.nil?
  end

  def log_out_cafe
    session.delete(:cafe_id)
    @current_cafe = nil
  end
end
