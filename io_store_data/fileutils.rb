require "fileutils"
FileUtils.makedirs("/tmp/these/dirs/need/not/exists")
Dir.chdir("/tmp/these/dirs/need/not/exists")
puts Dir.pwd

p Dir.entries("/tmp").include?("these")
FileUtils.rm_r("/tmp/these/") # аналогично Pathname.new("/tmp/these/").rmtree
p Dir.entries("/tmp").include?("these")
