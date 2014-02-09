require 'sinatra'
require 'slim'

get '/' do
  slim :index
end

post '/' do
  num = params[:num]
  m = params[:m]
  int_m = m.to_i
  c = StarCount.new
  @total = c.star_total(num,int_m)
  slim :task
end

class StarCount

  def star_total(num,m)
    total = 0
    row = m
    col = 2*m-1
    # 计算每个数字所需的星星数
    star_num_arr = num.split('').map { |i| calculate(i) }.map { |n| row*n[0]+n[1]*(col-n[0]) }
    # 求和
    total = eval star_num_arr.join('+')
  end

private
  # 行与列的关系
  def calculate(i)
    one_num_star = 0
    case i
    when '0'
      row = 2, col = 2
    when '1'
      row = 0, col = 1
    when '2'
      row = 3, col = 1
    when '3'
      row = 3, col = 1
    when '4'
      row = 1, col = 1.5
    when '5'
      row = 3, col = 1
    when '6'
      row = 3, col = 1.5
    when '7'
      row = 1, col = 1
    when '8'
      row = 3, col = 2
    when '9'
      row = 3, col = 1.5
    else

    end
  end
end