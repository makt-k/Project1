Mthropology::Application.configure do

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.assets.version = '1.0'

  config.log_level = :info

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.paperclip_defaults = {
  :storage => :s3,
  :s3_credentials => {
      :bucket => ENV['mthropology'],
      :access_key_id => ENV['AKIAJRCN2YUQLRMMO52A'],
      :secret_access_key => ENV['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']
  }
}
end
