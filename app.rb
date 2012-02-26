# -*- coding: utf-8 -*-
DataMapper.setup(:default, 'sqlite3:db.sqlite3')

class Post
  include DataMapper::Resource
  property :id, Serial
  property :user, String
  property :create_at, DateTime
  auto_upgrade!
end

get '/' do
  Post.all.map{|r| "#{r.id}, #{r.user},#{r.create_at} <br />"} 
end

get '/create' do
  post = Post.create(:user => params[:user],:create_at => Time.now)
  "#{params[:user]}"
end
