module SendCsv
  VERSION = '0.3.1'
end

# Based on http://stackoverflow.com/questions/3468858/rails-3-0-engine-execute-code-in-actioncontroller/3484141#3484141

require 'action_controller'  # Make sure ActionController::Base is defined

ActionController::Base.class_eval do
  private

  def generate_csv(lines, options = {})
    require 'csv'
    
    options = options.dup
    encoding = options.delete(:encoding) || 'ISO-8859-1'
    
    csv = lines.map { |values| CSV.generate_line(values, ';') + "\r\n" }.join
    csv = Iconv.conv(encoding, 'utf-8', csv)
    
    csv
  end

  def send_csv(lines, options = {})
    options = options.dup
    encoding = options.delete(:encoding) || 'ISO-8859-1'
    
    options = {
      :disposition => "attachment",
      :type => 'text/csv',
    }.merge(options)
    
    csv = generate_csv(lines, options)
    
    send_data csv, options
  end
end
