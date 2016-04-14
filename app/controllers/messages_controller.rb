class MessagesController < ApplicationController
 def new
    @message = Message.new
    @messages = Message.order('created_at DESC')

  end

<<<<<<< HEAD

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



=======
def create
    respond_to do |format|
      if current_user
        @message = current_user.messages.build(message_params)
        if @message.save
          flash.now[:success] = 'Your comment was successfully posted!'
        else
          flash.now[:error] = 'Your comment cannot be saved.'
        end
        format.html {redirect_to 'messages/new'}
        format.js
      else
        format.html {redirect_to 'messages/new'}
        format.js {render nothing: true}
      end
    end
  end
>>>>>>> aa833e6a306d070bdf5fadaf72091d2f84464f1c
private

def message_params
  params.require(:message).permit(:body)
end

end
