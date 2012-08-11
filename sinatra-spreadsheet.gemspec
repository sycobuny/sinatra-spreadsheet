Gem::Specification.new do |s|
    s.name    = 'sinatra-spreadsheet'
    s.version = '0.1.0'

    if s.respond_to?(:required_rubygems_version=)
       s.required_rubygems_version = Gem::Requirement.new(">= 0")
    end
    s.authors  = ['Stephen Belcher']
    s.email    = 'sbelcher@gmail.com'
    s.date     = '2012-08-11'
    s.homepage = 'https://github.com/sycobuny/sinatra-spreadsheet'
    s.description = 'Simple Sinatra rendering extension for spreadsheets ' +
                    'using the Spreadsheet gem.'
    s.summary     = s.description

    s.extra_rdoc_files = %w(LICENSE README.md)
    s.files = %w(LICENSE README.md VERSION.yml lib/sinatra/spreadsheet.rb)

    s.require_paths = ['lib']

    s.rubygems_version = %q{1.3.1}

    if s.respond_to?(:specification_version)
        current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
        s.specification_version = 2

        if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0')
            s.add_runtime_dependency('spreadsheet', ['>= 0.7.1'])
        else
            s.add_dependency('spreadsheet', [">= 0.7.1"])
        end
    else
        s.add_dependency('prawn', ['>= 0.7.1'])
    end
end
