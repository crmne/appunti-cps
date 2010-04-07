# Forks and execs given cmd, acting more like a shell.
def system cmd, *args
  fork do
    yield if block_given?
    exec(cmd, *args) rescue nil
    exit! 1 # never gets here unless exec failed
  end
  Process.wait
  $?.success?
end

def change_extension file, ext
  File.join(File.dirname(file),File.basename(file, File.extname(file)) + ext)
end

graphs = (FileList[ 'graphs/*.asy' ] - [ 'graphs/common.asy' ]).map do |graph|
  change_extension graph, '.pdf'
end

graphs.each do |graph|
  asy = change_extension graph, '.asy'
  desc "Plots #{graph}"
  file graph => asy do |t|
    Dir.chdir File.dirname graph do
      raise unless system 'asy', '-vv', '-tex', 'pdflatex', File.basename(asy)
    end
  end
end

desc "Plots all the graphs"
task :graphs => graphs

desc "Compiles appunti.pdf"
file "appunti.pdf" => graphs + FileList[ '*.tex' ] do
  # needs to compile 2 times to get the index
  2.times { raise unless system 'pdflatex', 'appunti.tex' }
end

desc "Cleans crap"
task :clean do
  would_remove = `git clean -x -n`
  unless would_remove.empty?
    puts would_remove
    print "Do you want to continue? [yn] "
    puts `git clean -x -f` if $stdin.gets.chomp == 'y'
  end
end

namespace :download do
  desc "Prepares compiled pdf for distribution"
  task :prepare => [ "appunti.pdf" ] do |t|
    t.prerequisites.each do |dep|
      date = File.ctime(dep).strftime('%Y%m%d')
      newname = File.basename(dep, File.extname(dep)) + '-' + date + '.pdf'
      FileUtils.cp(dep, newname)
      puts "#{dep} -> #{newname}"
    end
  end  
end

task :default => [ "appunti.pdf" ]
