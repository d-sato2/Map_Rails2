class HokkaidoController < ApplicationController
  protect_from_forgery except: :edit
  def index
    @hvalues = Hvalue.all
    @versions = PaperTrail::Version.order('created_at DESC')
    @column = [:vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib]
    @value = [["会社No.1", '1'], ["会社No.2", '2'], ["会社No.3", '3'], ["会社No.4", '4'], ["会社No.5", '5'], ["会社No.6", '6'],
              ["会社No.7", '7'], ["会社No.8", '8'], ["会社No.9", '9'], ["会社No.10", '10'], ["会社No.11", '11'], ["会社No.12", '12'],
              ["会社No.13", '13'], ["会社No.14", '14'], ["会社No.15", '15'], ["会社No.16", '16'], ["会社No.17", '17'], ["会社No.18", '18'],
              ["会社No.19", '19'], ["会社No.20", '20'], ["会社No.21", '21'], ["会社No.22", '22'], ["会社No.23", '23'], %W(\u4E0D\u660E 0)]

    @search = Hvalue.search(params[:search])
    @service_btn = [["eac", "b"], ["frs", "c"], ["eps", "d"], ["ca", "e"], ["pa", "f"],
           ["gw", "g"], ["cms", "h"], ["mail", "i"], ["bu", "j"], ["rs", "k"], ["ps", "l"],
           ["fn", "m"], ["ns", "n"], ["ss", "o"], ["ft", "p"], ["et", "q"], ["ib", "r"]]
    @kiban_btn = [["vender", "a-1"], ["kyougi", "a-2"], ["kiban", "a-3"], ["el_kyodo", "a-4"],
           ["kokaike", "a-5"], ["koumu", "a-6"], ["todoku", "a-7"]]
  end

  def show
    @hvalue = Hvalue.find(params[:id])
    @versions = PaperTrail::Version.order('created_at DESC')
    render layout: false
  end

  def edit2
    @bureau_for_select = [["石狩", "石狩"], ["空知", "空知"], ["後志", "後志"], ["胆振", "胆振"], ["日高", "日高"], ["渡島", "渡島"],
               ["檜山", "檜山"], ["上川", "上川"], ["留萌", "留萌"], ["宗谷", "宗谷"], ["オホーツク", "オホーツク"], ["十勝", "十勝"],
               ["釧路", "釧路"], ["根室", "根室"]]
    @bureau = Hvalue.new unless params.key?(:bureau)

    if params.key?(:hvalue)
      @bureau_test = Hvalue.search_bureau(params[:hvalue][:bureau])
    end

    @search = Hvalue.search(params[:search])
    @hvalue = Hvalue.new unless params.key?(:cityname)
  end

  def edit
    @versions = PaperTrail::Version.order('created_at DESC')
    @hvalue = Hvalue.find(params[:id])
    @value = [["会社No.1", '1'], ["会社No.2", '2'], ["会社No.3", '3'], ["会社No.4", '4'], ["会社No.5", '5'], ["会社No.6", '6'],
              ["会社No.7", '7'], ["会社No.8", '8'], ["会社No.9", '9'], ["会社No.10", '10'], ["会社No.11", '11'], ["会社No.12", '12'],
              ["会社No.13", '13'], ["会社No.14", '14'], ["会社No.15", '15'], ["会社No.16", '16'], ["会社No.17", '17'], ["会社No.18", '18'],
              ["会社No.19", '19'], ["会社No.20", '20'], ["会社No.21", '21'], ["会社No.22", '22'], ["会社No.23", '23'], %W(\u4E0D\u660E 0)]
    @service_column = [:eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib]
    @kiban_column = [:vender, :kyougi, :kiban, :el_kyodo, :kokaike, :koumu, :todoku]
    render layout: false
    @search = Hvalue.search(params[:search])
  end

  def update
    @hvalue = Hvalue.find_by(cityname: params[:hvalue][:cityname])
    if @hvalue.update_attributes(hvalue_params)
      if params[:id] == 'update'
        redirect_to action: 'index'
      else
      # flash[:success] = params[:hvalue][:cityname] + "の情報を更新しました"
      redirect_to action: 'edit'
      end
    else
      # flash[:error] = "変更に失敗しました"
      render 'edit'
    end
  end

  def info
    @versions = PaperTrail::Version.order('created_at DESC')
    render layout: false
  end

  def csv
    @hvalues = Hvalue.all

    respond_to do |format|
      format.html
      format.csv { send_data @hvalues.to_csv }
      format.xls { send_data @hvalues.to_csv(col_sep: "\t") }
    end
  end

  def csv_version
    @versions = PaperTrail::Version.where("length(object_changes) < 300").order('created_at DESC')

    respond_to do |format|
      format.html
      format.csv { send_data @versions.to_csv }
      format.xls { send_data @versions.to_csv(col_sep: "\t") }
    end
  end

  def hokkaido_map
    data = File.read('db/hokkaido_map.json')
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

  def select_bureau
    @bureau_test = Hvalue.search_bureau(params[:hvalue][:bureau])
  end

  private

  def hvalue_params
    params.require(:hvalue).permit(:kyougi, :memo_service, :memo_kiban, :todoku, :koumu, :kokaike, :el_kyodo, :kiban, :vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib,)
  end
end
