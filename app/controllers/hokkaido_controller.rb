class HokkaidoController < ApplicationController
  protect_from_forgery except: :edit
  def index
    @hservices = Hservice.all
    @search = Hvalue.search(params[:search])
    @iframeURL = "http://localhost:3000/hokkaido/info"
  end

  def edit
    @iframeURL = "http://localhost:3000/hokkaido/info"
    @hvalues = Hvalue.all
    @hvalue = @hvalues.find(params[:id])
    @hcontact = @hvalue.hcontacts
    @hservices = Hservice.all
    @versions = PaperTrail::Version.order('created_at DESC')
    render layout: false
  end

  def update
    @hvalue = Hvalue.find_by(cityname: params[:hvalue][:cityname])
    if @hvalue.update_attributes(hvalue_params)
      # flash[:success] = params[:hvalue][:cityname] + "の情報を更新しました"
      redirect_to action: 'edit'
    else
      # flash[:error] = "変更に失敗しました"
      render 'edit'
    end
  end

  def info
    @hservices = Hservice.all
    @versions = PaperTrail::Version.order('created_at DESC')
    render layout: false
  end

  def csv
    @hvalues = Hvalue.all

    respond_to do |format|
      format.html
      format.csv { send_data @hvalues.to_csv, filename: "#{Date.today}_北海道_自治体情報.csv" }
      format.xls { send_data @hvalues.to_csv(col_sep: "\t"), filename: "#{Date.today}_北海道_自治体情報.xls" }
    end
  end

  def csv_version
    @versions = Version.all

    respond_to do |format|
      format.html
      format.csv { send_data @versions.to_csv, filename: "#{Date.today}_北海道_更新履歴.csv" }
      format.xls { send_data @versions.to_csv(col_sep: "\t"), filename: "#{Date.today}_北海道_更新履歴.xls" }
    end
  end

  def hokkaido_map
    data = File.read('db/hokkaido_map.json')
    render json: data
  end

  def hokkaido_only
    data = File.read('db/hokkaido_only.json')
    render json: data
  end

  def hokkaido_value
    data = Hvalue.all
    render json: data.to_json(except: [:created_at, :updated_at])
  end

  def move_edit
    @hvalue = Hvalue.find_by(cityname: params[:hvalue][:cityname])
    redirect_to "/hokkaido/#{@hvalue.id}/edit"
  end

  def move_show
    @hvalue = Hvalue.find_by(cityname: params[:hvalue][:cityname])
    redirect_to "/hokkaido/show/#{@hvalue.id}"
  end

  private

  def hvalue_params
    params.require(:hvalue).permit(:cityname, :kyougi, :memo_service, :memo_kiban, :todoku, :koumu, :kokaike, :el_kyodo, :kiban, :vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib,)
  end
end
