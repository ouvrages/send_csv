# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{send_csv}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ouvrages"]
  s.date = %q{2011-06-24}
  s.description = %q{Adds to ApplicationController a send_csv method working like send_file.}
  s.email = ["contact@ouvrages-web.fr"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/send_csv.rb", "test/test_send_csv.rb", ".gemtest"]
  s.homepage = %q{https://github.com/ouvrages/send_csv}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{send_csv}
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Adds to ApplicationController a send_csv method working like send_file.}
  s.test_files = ["test/test_send_csv.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.9.4"])
    else
      s.add_dependency(%q<hoe>, [">= 2.9.4"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.9.4"])
  end
end
