class HokkaidoController < ApplicationController
  protect_from_forgery except: :edit
  def index
    @bureau_id = {"isikari" => ["id011002","id012173","id012246","id012319","id012343","id012351",
                            "id012330", "id013030", "id013048"]}
    @names = { "vender" => "サー１", "kyougi" => "サー２", "kiban" => "サー３",
                "el_kyodo" => "サー４", "kokaike" => "サー５", "koumu" => "サー６",
                "todoku" => "サー７", "eac" => "サー８", "frs" => "サー９",
                "eps" => "サー１０", "ca" => "サー１１", "gw" => "サー１２",
                "cms" => "サー１３", "mail" => "サー１４", "bu" => "サー１５",
                "rs" => "サー１６", "ps" => "サー１７", "fn" => "サー１８",
                "ns" => "サー１９", "ib" => "サー２０" }
    @service_comment = { "vender" => "サー１の解説",
                        "kyougi" => "サー２の解説",
                        "kiban" => "サー３の解説",
                        "el_kyodo" => "サー４の解説",
                        "kokaike" => "サー５の解説",
                        "koumu" => "サー６の解説",
                        "todoku" => "サー７の解説",
                        "eac" => "サー８の解説",
                        "frs" => "サー９の解説",
                        "eps" => "サー１０の解説",
                        "ca" => "サー１１の解説",
                        "gw" => "サー１２の解説",
                        "cms" => "サー１３の解説",
                        "mail" => "サー１４の解説",
                        "bu" => "サー１５の解説",
                        "rs" => "サー１６の解説",
                        "ps" => "サー１７の解説",
                        "fn" => "サー１８の解説",
                        "ns" => "サー１９の解説",
                        "ib" => "サー２０の解説" }

    @hvalues = Hvalue.all
    @versions = PaperTrail::Version.order('created_at DESC')
    @column = [:vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib]
    @value = [["会社No.1", '1'], ["会社No.2", '2'], ["会社No.3", '3'], ["会社No.4", '4'], ["会社No.5", '5'], ["会社No.6", '6'],
              ["会社No.7", '7'], ["会社No.8", '8'], ["会社No.9", '9'], ["会社No.10", '10'], ["会社No.11", '11'], ["会社No.12", '12'],
              ["会社No.13", '13'], ["会社No.14", '14'], ["会社No.15", '15'], ["会社No.16", '16'], ["会社No.17", '17'], ["会社No.18", '18'],
              ["会社No.19", '19'], ["会社No.20", '20'], ["会社No.21", '21'], ["会社No.22", '22'], ["会社No.23", '23'], %W(\u4E0D\u660E 0)]

    @search = Hvalue.search(params[:search])
    @service_btn = [["el_kyodo", "サー４"], ["koumu", "サー６"], ["ns", "サー１９"], ["mail", "サー１４"],
                    ["bu", "サー１５"], ["ib", "サー２０"], ["vender", "サー１"]]
    @kiban_btn = [["kyougi", "サー２"], ["kiban", "サー３"], ["eac", "サー８"], ["frs", "サー９"],
                  ["eps", "サー１０"], ["ca", "サー１１"], ["kokaike", "サー５"], ["todoku", "サー７"],["gw", "サー１２"],
                  ["cms", "サー１３"], ["rs", "サー１６"], ["ps", "サー１７"], ["fn", "サー１８"]]
  end

  def show
    @hvalue = Hvalue.find(params[:id])
    @versions = PaperTrail::Version.order('created_at DESC')
    render layout: false
  end

  def edit
    @versions = PaperTrail::Version.order('created_at DESC')
    @hvalue = Hvalue.find(params[:id])
    @value = [["会社No.1", '1'], ["会社No.2", '2'], ["会社No.3", '3'], ["会社No.4", '4'], ["会社No.5", '5'], ["会社No.6", '6'],
              ["会社No.7", '7'], ["会社No.8", '8'], ["会社No.9", '9'], ["会社No.10", '10'], ["会社No.11", '11'], ["会社No.12", '12'],
              ["会社No.13", '13'], ["会社No.14", '14'], ["会社No.15", '15'], ["会社No.16", '16'], ["会社No.17", '17'], ["会社No.18", '18'],
              ["会社No.19", '19'], ["会社No.20", '20'], ["会社No.21", '21'], ["会社No.22", '22'], ["会社No.23", '23'], %W(\u4E0D\u660E 0)]
    @kiban_column = [:kiban, :el_kyodo, :kokaike, :koumu, :todoku]
    @vender_value = [["hoge", "hoge"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["会社", "会社"], ["その他", "その他"]]
    @kyougi_value = [["参加", "参加"], ["不参加", "不参加"]]
    @kokaike_value = [["未導入", "未導入"], ["改訂", "改訂"], ["基準", "基準"], ["改訂（町村会）", "改訂（町村会）"], ["基準（町村会）", "基準（町村会）"]]
    @others_value = [["導入", "導入"], ["未導入", "未導入"]]


    @service_column = [:eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib]

    @names = { "vender" => "サー１", "kyougi" => "サー２", "kiban" => "サー３",
                "el_kyodo" => "サー４", "kokaike" => "サー５", "koumu" => "サー６",
                "todoku" => "サー７", "eac" => "サー８", "frs" => "サー９",
                "eps" => "サー１０", "ca" => "サー１１", "gw" => "サー１２",
                "cms" => "サー１３", "mail" => "サー１４", "bu" => "サー１５",
                "rs" => "サー１６", "ps" => "サー１７", "fn" => "サー１８",
                "ns" => "サー１９", "ib" => "サー２０" }

    render layout: false
    @search = Hvalue.search(params[:search])
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
    @names = { "vender" => "サー１", "kyougi" => "サー２", "kiban" => "サー３",
                "el_kyodo" => "サー４", "kokaike" => "サー５", "koumu" => "サー６",
                "todoku" => "サー７", "eac" => "サー８", "frs" => "サー９",
                "eps" => "サー１０", "ca" => "サー１１", "gw" => "サー１２",
                "cms" => "サー１３", "mail" => "サー１４", "bu" => "サー１５",
                "rs" => "サー１６", "ps" => "サー１７", "fn" => "サー１８",
                "ns" => "サー１９", "ib" => "サー２０" }
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

  private

  def hvalue_params
    params.require(:hvalue).permit(:cityname, :kyougi, :memo_service, :memo_kiban, :todoku, :koumu, :kokaike, :el_kyodo, :kiban, :vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib,)
  end
end
