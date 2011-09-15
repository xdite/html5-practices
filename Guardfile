# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{source/.+\.(erb|haml|md)})
  watch(%r{source/helpers/.+\.rb})
  watch(%r{(public/|source/assets).+\.(css|js|html)})
  watch(%r{(source/.+\.css)\.s[ac]ss}) { |m| m[1] }
  watch(%r{(source/.+\.js)\.coffee}) { |m| m[1] }
  watch(%r{config/locales/.+\.yml})
end
