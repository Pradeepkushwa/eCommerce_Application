# -*- encoding: utf-8 -*-
# stub: activeadmin_quill_editor 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "activeadmin_quill_editor".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mattia Roccoberton".freeze]
  s.date = "2019-06-15"
  s.description = "An Active Admin plugin to use Quill Rich Text Editor".freeze
  s.email = "mat@blocknot.es".freeze
  s.homepage = "https://github.com/blocknotes/activeadmin_quill_editor".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Quill Editor for ActiveAdmin".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activeadmin>.freeze, [">= 1.0"])
  else
    s.add_dependency(%q<activeadmin>.freeze, [">= 1.0"])
  end
end
