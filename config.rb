###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }


# Helpers
helpers do
def is_page_selected(page)
current_page.url == page ? "active" : ''
end
end

#activate :middleman_simple_thumbnailer1

activate :directory_indexes

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.name = "articles"
  blog.prefix = "articles"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.permalink = "{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 2
  blog.page_link = "page/{num}"
end

activate :blog do |blog|
  blog.name = "notes"
  blog.prefix = "notes"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.permalink = "{title}.html"

  blog.paginate = true
  blog.per_page = 2
  blog.page_link = "page/{num}"
end 

activate :blog do |blog|
  blog.name = "things"
  blog.prefix = "a-thing-a-day"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.permalink = "{title}"

  blog.paginate = true
  blog.per_page = 2
  blog.page_link = "page/{num}"
end

def articles_by_tag(tag)
  sitemap.resources.select do |resource|
    binding.pry resource
    resource.data.tags.include?(tag)
  end
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
