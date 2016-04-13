class MessagesController < ApplicationController
 def new
    @message = Message.new
    @messages = Message.order('created_at DESC')

  end

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
private

def message_params
  params.require(:message).permit(:body)
end

end
