# encoding: UTF-8

require 'sinatra'
require './block'

b = Blockchain.new

get '/' do 
	"블럭 리스트 입니다."
end

get '/mine' do
	"마이닝 중입니다."
end