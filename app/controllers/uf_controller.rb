class UfController < ActionController::API
  def respuesta
    requested_date = params[:date]
    uf = Uf.find_by(fecha: requested_date)
    if uf.nil? 
      request = 'UF no encontrada'
    else
      request = {requested_date: requested_date, valor: uf.value}
    end
   
    User.create(username: params["x-client"], uf_value: request, date_request: requested_date)
    render json: request
  end

  def requestq
    request_user = User.where(username: params[:username])
    if request_user.nil?
      q = 0
    else
      q = request_user.count
    end
    render json: q
  end
 
end

