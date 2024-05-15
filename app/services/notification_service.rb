#require 'stripe'

class NotificationService
   include HTTParty
  
  def initialize(params)
    @source = params[:source]
    @organization = params[:organization] 
    @client = params[:client]
    @to = params[:to]
    @type = params[:type]
    @msg = ""
  end


  def send_notification
      @msg = eval(@type)
      body = {
                "to": @to,
                "sound": "default",
                "body": @msg
              }.to_json
      post = HTTParty.post 'https://exp.host/--/api/v2/push/send',
                            :body => body,
                            :headers =>  {
                                            "host"=>"exp.host",
                                            "accept"=>"application/json",
                                            "accept-encoding"=>"gzip, deflate",
                                            "content-type"=>"application/json"
                                          }

  end

  

  def app_activity
    "Um dispositivo abriu o camp-entregas"    
  end

  def organization_updated_token
    "#{@organization} Atualizou o seu token"    
  end

  def admin_new_order
    "#{@client} acaba de fazer um novo pedido em #{@organization}"    
  end

  def new_order
    "#{@client} acaba de fazer um novo pedido"    
  end


  private

  # attr_reader :card, :amount, :email

  def external_charge_service
  end


end