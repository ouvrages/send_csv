require 'iconv'

module SendCsv
  VERSION = '0.5'
  
  module_function
  def generate_csv(lines, options = {})
    require 'csv'

    options = options.dup
    encoding = options.delete(:encoding) || 'ISO-8859-1//TRANSLIT'
    
    csv = lines.map { |values| CSV.generate_line(values, :col_sep => ';', :row_sep => "\r\n") }.join
    csv = Iconv.conv(encoding, 'UTF-8', csv)
    
    csv
  end

  def send_csv(lines, options = {})
    options = options.dup
    encoding = options.delete(:encoding) || 'ISO-8859-1//TRANSLIT'
    
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
