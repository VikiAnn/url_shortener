class Redirect
  def initialize(app)
    @app = app
  end

  def call(env)
    length = env["PATH_INFO"].length - 1
    hashid = env["PATH_INFO"].slice(1, length)
    return @app.call(env) if hashid.start_with?('api')

    link = Rails.cache.fetch(hashid) do
      Link.find_by!(hashid: hashid)
    end

    [ 302, { 'Location' => link.uri}, [ ] ]
  end
end
