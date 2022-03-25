configure do
  set :port, 8080
  set :bind, '0.0.0.0'
  set :protection, :except => :frame_options
end
