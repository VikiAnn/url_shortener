class Redirect
  def self.call(env)
    length = env["REQUEST_PATH"].length - 1
    hashid = env["REQUEST_PATH"].slice(1, length)
    link = Rails.cache.fetch(hashid) do
      Link.find_by!(hashid: hashid)
    end

    [ 302, { 'Location' => link.uri}, [ ] ]
  end
end
