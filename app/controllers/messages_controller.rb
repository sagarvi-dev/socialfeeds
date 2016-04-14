class MessagesController < ApplicationController
 def new
    @message = Message.new
    @messages = Message.order('created_at DESC')

  end


def create
  if current_user
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = 'your message sent!'
    else
      flash[:error] = 'Your message can not sent.'
    end
  end
  redirect_to 'messages/new'
end

private



private

def message_params
  params.require(:message).permit(:body)
end

end
