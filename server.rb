# encoding: UTF-8

require 'sinatra'
require './block'

b = Blockchain.new

get '/' do
	message = "<center>"

	b.all_chains.each do |a|
		message << "번호는 : " + a["index"].to_s + "<br>"
		message << "Nonce는 : " + a["nonce"].to_s + "<br>"
		message << "시간은 : " + a["time"].to_s + "<br>"
		message << "앞 주소는 : " + a["previous_address"].to_s + "<br>"
		message << "내 주소는 : " + Digest::SHA256.hexdigest(a.to_s) + "<br>"
		message << "거래정보 : " + a["transactions"].to_s + "<br>"
		message << "<hr>"
	end
	message << "</center>"
	message
end

get '/mine' do
	b.mining.to_s
end

get '/trans' do
	b.make_a_trans(params["sender"], params["rcpt"], params["amount"])
end

get '/new_wallet' do
	b.make_a_wallet.to_s
end

get '/wallet_list' do
	b.wallet_list.to_s
end