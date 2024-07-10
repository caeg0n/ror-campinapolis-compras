module ResponseHandler

  STATES = { success: 'success',
             not_found: 'not_found', 
             not_exist: 'not_exist',
             not_authorized: 'not_authorized',
             invalid_value: 'invalid_value',
             destroyed: 'destroyed',
             fail: 'fail',
             paused: 'paused',
             active: 'active'}.freeze
  
  def render_json_response(obj:{}, state:{}, message: nil, status: :ok)
    render json: {
      data: obj,
      message: message,
      state: state,
    }, status: status
  end

  def render_error_response(object:{}, errors:, status: :unprocessable_entity)
    render json: {
      data: object,
      errors: errors,
    }, status: status
  end
end