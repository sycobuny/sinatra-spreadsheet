require 'sinatra/base'

module Sinatra
    module Spreadsheet
        module Helpers
            def spreadsheet(template = nil, options = {}, locals = {}, &block)
                options, template = template, nil if template.is_a?(Hash)
                template = lambda { block } if template.nil?
                options[:layout] = false
                render :spreadsheet, template, options, locals
            end
        end

        def self.registered(app)
            app.helpers Spreadsheet::Helpers
        end
    end

    register Spreadsheet
end

module Tilt
    class SpreadsheetTemplate < Template
        def initialize_engine
            return if defined? ::Spreadsheet::Workbook
            require_template_library 'spreadsheet'
        end

        def prepare
        end

        def evaluate(scope, locals, &block)
            workbook = ::Spreadsheet::Workbook.new

            if data.respond_to?(:to_str)
                locals[:workbook] = workbook
                super(scope, locals, &block)
            elsif data.kind_of?(Proc)
                data.call(workbook)
            end

            workbook.write(str = StringIO.new('', 'w'))
            str.string
        end

        def precompiled_template(locals)
            data.to_str
        end
    end

    register 'spreadsheet', SpreadsheetTemplate
end
