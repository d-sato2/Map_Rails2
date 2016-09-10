class HokkaidoController < ApplicationController
  protect_from_forgery except: :edit
  @@versionLength = PaperTrail::Version.select("id").count
  def index
    @hservices = Hservice.all
    @hservices_name = @hservices.to_json(only: [:keyName ,:serviceName, :comment])
    @hservices_name_array = JSON.parse(@hservices_name)
    @versions = PaperTrail::Version.order('created_at DESC').limit(100)
    @oldVersionCount = 314
    @search = Hvalue.search(params[:search])
    @hselections = Hselection.all
    @vender = @hselections.uniq.pluck(:vender)
  end

  def edit
    @hvalues = Hvalue.all
    @hvalue = @hvalues.find(params[:id])
    @hcontact = @hvalue.hcontacts
    @hservices = Hservice.all
    @hselections = Hselection.all
    @versions = PaperTrail::Version.where('object like ? OR object_changes like ?', "%#{@hvalue.cityname}%", "%#{@hvalue.cityname}%").order('created_at DESC')
    @oldVersionCount = 314
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
  end

  def cluster
  end

  def dl_jiti_info
    @hvalues = Hvalue.all
    respond_to do |format|
      format.html
      format.csv { send_data @hvalues.to_csv.encode(Encoding::CP932, invalid: :replace, undef: :replace), filename: "#{Date.today}_北海道_自治体情報.csv" }
      format.xls { send_data @hvalues.to_csv(col_sep: "\t"), filename: "#{Date.today}_北海道_自治体情報.xls" }
      format.json { send_data JSON.pretty_generate(JSON.parse(@hvalues.to_json(except: [:created_at, :updated_at]))), filename: "#{Date.today}_北海道_自治体情報.json", type: :json }
    end
  end

  def dl_update_info
    @versions = Version.all
    respond_to do |format|
      format.html
      format.csv { send_data @versions.to_csv.encode(Encoding::CP932, invalid: :replace, undef: :replace), filename: "#{Date.today}_北海道_更新履歴.csv" }
      format.xls { send_data @versions.to_csv(col_sep: "\t"), filename: "#{Date.today}_北海道_更新履歴.xls" }
      format.json { send_data JSON.pretty_generate(JSON.parse(@versions.to_json)), filename: "#{Date.today}_北海道_更新履歴.json", type: :json }
    end
  end

  def dl_contact_info
    @hcontacts = Hcontact.all
    respond_to do |format|
      format.html
      format.json { send_data JSON.pretty_generate(JSON.parse(@hcontacts.to_json(except: [:created_at, :updated_at]))), filename: "#{Date.today}_北海道_連絡先.json", type: :json }
    end
  end

  def dl_selection_info
    @hselections = Hselection.all
    respond_to do |format|
      format.html
      format.json { send_data JSON.pretty_generate(JSON.parse(@hselections.to_json(except: [:created_at, :updated_at]))), filename: "#{Date.today}_北海道_サービス選択肢.json", type: :json }
    end
  end

  def dl_service_info
    @hservices = Hservice.all
    respond_to do |format|
      format.html
      format.json { send_data JSON.pretty_generate(JSON.parse(@hservices.to_json(except: [:created_at, :updated_at]))), filename: "#{Date.today}_北海道_サービス説明.json", type: :json }
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

  def dl
  end

  private

  def hvalue_params
    params.require(:hvalue).permit(:cityname, :kyougi, :memo_service, :memo_kiban, :todoku, :koumu, :kokaike, :el_kyodo, :kiban, :vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib, :sc, :sc_op1, :sc_op2, :sc_op3, :sc_op4, :sc_op5, :sc_op6)
  end
end
