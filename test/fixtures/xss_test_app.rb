require 'erb'
require 'rack'
require 'lotus/utils/escape'

class XssTestApp
  def initialize
    @templates = {
      '/reflected' => File.read('test/fixtures/reflected.erb'),
      '/stored'    => File.read('test/fixtures/stored.erb'),
    }
  end

  def call(env)
    @params  = Rack::Request.new(env).params
    template = @templates.fetch(env['PATH_INFO'])

    [200, {}, [ERB.new(template).result(binding)]]
  end
end
