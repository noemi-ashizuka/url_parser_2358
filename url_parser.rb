# Tests for Rubular:
# http://www.lewagon.com/
# http://www.lewagon.com
# https://www.rubular.org/
# https://www.lewagon.com/courses/apply
# https://www.lewagon.com/courses
# https://www.lewagon.com/berlin?search=currywurst
# https://www.lewagon.com/london?bootcamp=web&season=autumn
# https://www.lewagon.com/london?bootcamp=web&season=autumn&search=currywurst

def parse_url(url)
  regex = /(?<scheme>https?):\/\/(?<sub>www)\.(?<domain>\w+)\.(?<tld>\w+)\/?(?<path>[\w\/]*)\??(?<params>[\w=&]*)/
  # we need to use match method to get the match data object
  # use the match data to create a hash
  match_data = url.match(regex)
  params = {}

  path = match_data[:path].split("/")
  match_data[:params].split("&").each do |param_pair|
    params[param_pair.split("=")[0].to_sym] = param_pair.split("=")[1]
  end
  
  { 
      scheme: match_data[:scheme], 
      subdomain: match_data[:sub], 
      domain: match_data[:domain],
      top_level_domain: match_data[:tld], 
      path: path, 
      params: params || {}
    }
end
# p parse_url("http://www.lewagon.com/")

pp parse_url("https://www.lewagon.com/london?bootcamp=web&season=autumn")
pp parse_url("https://www.lewagon.com/courses/apply")