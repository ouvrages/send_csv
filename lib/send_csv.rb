module SendCsv
  VERSION = '0.1'
end

class ApplicationController
  def send_csv(lines, options = {})
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

