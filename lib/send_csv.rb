module SendCsv
  VERSION = '0.6'
  
  module_function
  def generate_csv(lines, options = {})
    require 'csv'

    options = options.dup
    encoding = options.delete(:encoding) || 'ISO-8859-15'
    
    csv = lines.map { |values| CSV.generate_line(values, :col_sep => ';', :row_sep => "\r\n") }.join
    csv = csv.encode(encoding, :invalid => :replace, :undef => :replace)
    
    csv
  end

  def send_csv(lines, options = {})
    options = options.dup
    
    options = {
      :disposition => "attachment",
      :type => 'text/csv',
    }.merge(options)
    
    csv = generate_csv(lines, options)
    
    send_data csv, options
  end
  
  class Engine < Rails::Engine    
    initializer 'send_csv.controller' do |app|  
      ActiveSupport.on_load(:action_controller) do  
         include SendCsv  
      end
    end
  end  
end
