class HokkaidoController < ApplicationController
  def index
  end

  def show
    @hvalue = Hvalue.find(params[:id])
  end

  def edit2
    @bureau_for_select = [%W(\u77F3\u72E9 \u77F3\u72E9), %W(\u7A7A\u77E5 \u7A7A\u77E5), %W(\u5F8C\u5FD7 \u5F8C\u5FD7), %W(\u80C6\u632F \u80C6\u632F), %W(\u65E5\u9AD8 \u65E5\u9AD8), %W(\u6E21\u5CF6 \u6E21\u5CF6),
                          %W(\u6A9C\u5C71 \u6A9C\u5C71), %W(\u4E0A\u5DDD \u4E0A\u5DDD), %W(\u7559\u840C \u7559\u840C), %W(\u5B97\u8C37 \u5B97\u8C37), %W(\u30AA\u30DB\u30FC\u30C4\u30AF \u30AA\u30DB\u30FC\u30C4\u30AF), %W(\u5341\u52DD \u5341\u52DD),
                          %W(\u91E7\u8DEF \u91E7\u8DEF), %W(\u6839\u5BA4 \u6839\u5BA4)]

    @bureau = Hvalue.new unless params.key?(:bureau)

    if params.key?(:hvalue)
      @bureau_test = Hvalue.search_bureau(params[:hvalue][:bureau])
    end

    @search = Hvalue.search(params[:search])

    @hvalue = Hvalue.new unless params.key?(:N03_004)
  end

  def edit
    @hvalue = Hvalue.find(params[:id])
    @value = [["会社No.1", '1'], ["会社No.2", '2'], ["会社No.3", '3'], ["会社No.4", '4'], ["会社No.5", '5'], ["会社No.6", '6'],
              ["会社No.7", '7'], ["会社No.8", '8'], ["会社No.9", '9'], ["会社No.10", '10'], ["会社No.11", '11'], ["会社No.12", '12'],
              ["会社No.13", '13'], ["会社No.14", '14'], ["会社No.15", '15'], ["会社No.16", '16'], ["会社No.17", '17'], ["会社No.18", '18'],
              ["会社No.19", '19'], ["会社No.20", '20'], ["会社No.21", '21'], ["会社No.22", '22'], ["会社No.23", '23'], %W(\u4E0D\u660E 0)]
    @column = [:vender, :eac, :frs, :eps, :ca, :pa, :gw, :cms, :mail, :bu, :rs, :ps, :fn, :ns, :ss, :ft, :et, :ib]
    render layout: false
  end

  def update
    @hvalue = Hvalue.find_by(N03_004: params[:hvalue][:N03_004])
    if @hvalue.update_attributes(hvalue_params)
      flash[:success] = params[:hvalue][:N03_004] + "の情報を更新しました"
      redirect_to action: 'edit'
    else
      flash[:error] = "変更に失敗しました"
      render 'edit'
    end
  end

  def info
    @bureau_for_select = [%W(\u77F3\u72E9 \u77F3\u72E9), %W(\u7A7A\u77E5 \u7A7A\u77E5), %W(\u5F8C\u5FD7 \u5F8C\u5FD7), %W(\u80C6\u632F \u80C6\u632F), %W(\u65E5\u9AD8 \u65E5\u9AD8), %W(\u6E21\u5CF6 \u6E21\u5CF6),
                          %W(\u6A9C\u5C71 \u6A9C\u5C71), %W(\u4E0A\u5DDD \u4E0A\u5DDD), %W(\u7559\u840C \u7559\u840C), %W(\u5B97\u8C37 \u5B97\u8C37), %W(\u30AA\u30DB\u30FC\u30C4\u30AF \u30AA\u30DB\u30FC\u30C4\u30AF), %W(\u5341\u52DD \u5341\u52DD),
                          %W(\u91E7\u8DEF \u91E7\u8DEF), %W(\u6839\u5BA4 \u6839\u5BA4)]

    @bureau = Hvalue.new unless params.key?(:bureau)

    if params.key?(:hvalue)
      @bureau_test = Hvalue.search_bureau(params[:hvalue][:bureau])
    end

    @search = Hvalue.search(params[:search])

    @hvalue = Hvalue.new unless params.key?(:N03_004)
  end

  def csv
    @hvalues = Hvalue.all

    respond_to do |format|
      format.html
      format.csv { send_data @hvalues.to_csv }
      format.xls { send_data @hvalues.to_csv(col_sep: "\t") }
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
