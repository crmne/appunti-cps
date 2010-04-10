require "rake/clean"
require "source_annotation_extractor"

CLEAN.include '*.aux', '*.log', '*.out', '*.toc', '*.fls', '.appunti.*'
CLOBBER.include '*.pdf', 'graphs/*.pdf'

task :default => "appunti.pdf"

graphs = FileList['graphs/*.asy'].exclude('graphs/common.asy').map { |g| g.ext 'pdf' }

desc "Plot all the graphs."
task :graphs => graphs

desc "Compile appunti.pdf."
file "appunti.pdf" => graphs + FileList['*.tex'] do
  2.times do # needs to compile 2 times to get the index
    sh 'pdflatex appunti.tex'
  end
end

namespace :download do

  desc "Prepare compiled pdfs for distribution."
  task :prepare => "appunti.pdf" do |t|
    t.prerequisites.each do |dep|
      cp dep, dep.ext("#{File.ctime(dep).hash}.pdf")
    end
  end

end

graphs.each do |graph|
  asyfile = graph.ext 'asy'

  # Generate per-graph task
  file graph => asyfile do |t|
    Dir.chdir File.dirname graph do
      sh "asy -v -tex pdflatex #{File.basename(asyfile)}"
    end
  end

end

desc "Enumerate all annotations."
task :notes do
  SourceAnnotationExtractor.enumerate "DOUBT|FIXME|TODO", :tag => true
end

namespace :notes do
  ["DOUBT", "FIXME", "TODO"].each do |annotation|
    desc "Enumerate all #{annotation} annotations."
    task annotation.downcase.intern do
      SourceAnnotationExtractor.enumerate annotation
    end
  end
end
