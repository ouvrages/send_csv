module SendCsv
  VERSION = '0.2'
end

require 'action_controller'  # Make sure ActionController::Base is defined

ActionController::Base.class_eval do
  private

  def send_csv(lines, options = {})
    require 'csv'
    
    options = options.dup
    encoding = options.delete(:encoding) || 'ISO-8859-1'
    
    options = {
      :disposition => "attachment",
      :type => 'text/plain',
    }.merge(options)
    
    csv = lines.map { |values| CSV.generate_line(values, ';') + "\r\n" }.join
    csv = Iconv.conv(encoding, 'utf-8', csv)
    
    send_data csv, options
  end
end
