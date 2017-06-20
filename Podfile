
# Allows per-dev overrides
local_podfile = "Podfile.local"
eval(File.open(local_podfile).read) if File.exist? local_podfile

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/neodym1337/ios-specs.git'




target 'iLikeIt' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for iLikeIt
  #pod 'NEOTestPod', '0.0.10'
	pod 'NEOTestPod', :path => '../NEOTestPod'

  target 'iLikeItTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
