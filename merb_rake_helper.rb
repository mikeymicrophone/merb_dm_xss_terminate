def sudo
  windows = (PLATFORM =~ /win32|cygwin/) rescue nil
  ENV['MERB_SUDO'] ||= "sudo"
  sudo = windows ? "" : ENV['MERB_SUDO']
end

def gemx
  win32 = (PLATFORM =~ /win32/) rescue nil
  win32 ? 'gem.bat' : 'gem'
end

def rakex
  win32 = (PLATFORM =~ /win32/) rescue nil
  win32 ? 'rake.bat' : 'rake'
end

def gems_path
  d, cwd = nil, Dir.pwd
  3.times do
    Dir.chdir('..')
    d = Dir.pwd and break if Dir.pwd =~ /\/gems$/i
  end
  Dir.chdir(cwd) and d
end