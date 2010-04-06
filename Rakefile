desc "Compiles appunti.pdf"
file "appunti.pdf" do |t|
  2.times do # needs to compile 2 times to get the index
    puts `pdflatex appunti.tex`
  end
end

desc "Clean crap"
task :clean do
  would_remove = `git clean -x -n`
  unless would_remove == ""
    puts would_remove
    print "Do you want to continue? [yn] "
    puts `git clean -x -f` if $stdin.gets.chomp == 'y'
  end
end

namespace :download do
  desc "Prepares pdf files for distribution"
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
