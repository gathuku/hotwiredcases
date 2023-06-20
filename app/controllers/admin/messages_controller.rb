class Admin::MessagesController < Admin::BaseController
  def index
    @messages = SubscriberMessage.all
  end

  def new
    @message = SubscriberMessage.new
  end

 def create 
   @message = SubscriberMessage.new(message_params)

   if @message.save
    redirect_to admin_messages_path, notice: "Message created"
    # SubscriberMailer.new_message(message: @message).deliver_later
   else
    render :new, status: :unprocessable_entity
   end
 end

 private

 def message_params
   params.require(:subscriber_message).permit(:content)
 end
end
