class HcontactController < ApplicationController
	def new
		if params[:id] && !(params[:id] == "undefined")
		    @hvalue = Hvalue.find(params[:id])
			@hcontact = @hvalue.hcontacts.build
		end
	    @search = Hvalue.search(params[:search])
    end

	def create
	    @hvalue = Hvalue.find_by(id: params[:hcontact][:hvalueId])
		@hcontact = @hvalue.hcontacts.build(hcontact_params)
		if @hcontact.save
		  flash[:success] = "連絡先を作成しました！"
		  redirect_to root_url
		else
		  render 'static_pages/home'
		end
	end

	def edit
		@hcontact = Hcontact.find(params[:id])
		@iframeURL = "http://localhost:3000/hokkaido/info"
	end

	def update
		@hcontact = Hcontact.find_by(id: params[:hcontact][:id])
		if @hcontact.update_attributes(hcontact_params)
		  # flash[:success] = params[:hvalue][:cityname] + "の情報を更新しました"
		  redirect_to controller: 'hokkaido',  action: 'index'
		else
		  # flash[:error] = "変更に失敗しました"
		  render 'edit_contact'
		end
	end

	def destroy
		@hcontact = Hcontact.find(params[:id])
		@hcontact.destroy
		flash[:success] = "連絡先を削除しました！"
		redirect_to request.referrer || root_url
	end

	private

	def hcontact_params
		params.require(:hcontact).permit(:cityname, :bureau, :service, :department, :person, :phone, :mail, :memo)
	end
end
