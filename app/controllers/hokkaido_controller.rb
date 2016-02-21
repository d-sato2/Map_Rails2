class HokkaidoController < ApplicationController
  def index
    @search = Hvalue.search(params[:search])
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
    @hvalue = Hvalue.new unless params.key?(:N03_004)
  end

  def edit
    @versions = PaperTrail::Version.order('created_at DESC')
    @hvalue = Hvalue.find(params[:id])
    @value = [["会社No.1", '1'], ["会社No.2", '2'], ["会社No.3", '3'], ["会社No.4", '4'], ["会社No.5", '5'], ["会社No.6", '6'],
              ["会社No.7", '7'], ["会社No.8", '8'], ["会社No.9", '9'], ["会社No.10", '10'], ["会社No.11", '11'], ["会社No.12", '12'],
              ["会社No.13", '13'], ["会社No.14", '14'], ["会社No.15", '15'], ["会社No.16", '16'], ["会社No.17", '17'], ["会社No.18", '18'],
              ["会社No.19", '19'], ["会社No.20", '20'], ["会社No.21", '21'], ["会社No.22", '22'], ["会社No.23", '23'], %W(\u4E0D\u660E 0)]
    @column = [:vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib]
    render layout: false
    @search = Hvalue.search(params[:search])
  end

  def update
    @hvalue = Hvalue.find_by(N03_004: params[:hvalue][:N03_004])
    if @hvalue.update_attributes(hvalue_params)
      # flash[:success] = params[:hvalue][:N03_004] + "の情報を更新しました"
      redirect_to action: 'edit'
    else
      # flash[:error] = "変更に失敗しました"
      render 'edit'
    end
  end

  def info
    @versions = PaperTrail::Version.order('created_at DESC')
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
    @hvalue = Hvalue.find_by(N03_004: params[:hvalue][:N03_004])
    redirect_to "/hokkaido/#{@hvalue.id}/edit"
  end

  def move_show
    @hvalue = Hvalue.find_by(N03_004: params[:hvalue][:N03_004])
    redirect_to "/hokkaido/show/#{@hvalue.id}"
  end

  def select_bureau
    @bureau_test = Hvalue.search_bureau(params[:hvalue][:bureau])
  end

  private

  def hvalue_params
    params.require(:hvalue).permit(:vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib)
  end
end
