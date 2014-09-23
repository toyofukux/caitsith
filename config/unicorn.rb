worker_processes 1
timeout 15
listen 3000
stderr_path File.expand_path('../../log/unicorn_err.log', __FILE__)
stdout_path File.expand_path('../../log/unicorn_stg.log', __FILE__)
pid File.expand_path('../../log/unicorn.pid', __FILE__)
preload_app false

